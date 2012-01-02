Libro = App.Libro

class Show extends Spine.Controller
  className: 'show'

  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=settori]': 'settori'

  constructor: ->
    console.log 'show'
    super
    @active @change

  render: ->
    @html @view('libri/show')(@item)

  change: (params) =>
    @item = Libro.find(params.id)
    @render()

  edit: ->
    @navigate '/libri', @item.id, 'edit'

  destroy: (e) ->
    if confirm('Sei sicuro?')
      @item.destroy() 
      @navigate '/libri'

  settori: -> 
    console.log 'navigate settori'
    @navigate '/settori'
  
  back: ->
    @navigate '/libri'


class Edit extends Spine.Controller
  
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click [data-type=url_giunti]': 'url_giunti'
    
  elements: 
    'form': 'form'  

  constructor: ->
    super
    
    # Libro.bind 'change', (libro) ->
    #   unless libro.image.url is null
    #     $('.content img').attr('src', "#{libro.image.url}").show()
    #   else
    #     $('.content img').hide()

    @active @change

  change: (params) =>
    @item = Libro.find(params.id)
    @item.remote_image_url = ""
    @item.remove_image = false
    @render()
    $('select[name=settore_nome]').val @item.settore_nome

  render: ->
    @html @view('libri/form')(@item)

  show: ->
    @navigate '/libri', @item.id

  submit: (e) ->
    e.preventDefault()
    console.log e.target
    if @item.fromForm(@form).save()
      @navigate '/libri', @item.id

  url_giunti: (e) ->
    e.preventDefault()
    $('input[name=remote_image_url]').val "http://catalogo.giunti.it/librig/#{ $('input[name=cm]').val()}.jpg"


class New extends Spine.Controller

  className: 'new'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click [data-type=url_giunti]': 'url_giunti'

  elements: 
    'form': 'form'  

  constructor: ->
    super
    @active @render

  render: ->
    @html @view('libri/form')

  back: ->
    @navigate '/libri'

  submit: (e) ->
    e.preventDefault()
    console.log e.target
    libro = Libro.fromForm(@form).save()
    @navigate '/libri', libro.id

  url_giunti: (e) ->
    e.preventDefault()
    $('input[name=remote_image_url]').val "http://catalogo.giunti.it/librig/#{ $('input[name=cm]').val()}.jpg"



class Main extends Spine.Stack
  controllers:
    edit:  Edit
    show:  Show
    new:   New

  className: 'stack main'
    
window.Main = Main