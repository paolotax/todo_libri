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
    'click [data-type=save]':   'submit'
    'click [data-type=delete]': 'delete'
    'submit form':              'submit'
    'click [data-type=url_giunti]': 'url_giunti'
    
  elements: 
    'form': 'form'  

  constructor: ->
    super
    
    Libro.bind 'change', (libro) ->
      unless libro.image.url is null
        $('.content img').attr('src', "#{libro.image.url}").show()
      else
        $('.content img').hide()
        
    @active @change

  change: (params) =>
    @item = Libro.find(params.id)
    @item.remote_image_url = ""
    @item.remove_image = false
    @render()
    $('select[name=settore_nome]').val @item.settore_nome

  render: ->
    @html @view('libri/edit')(@item)

  back: ->
    @navigate '/libri'

  show: ->
    @navigate '/libri', @item.id

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate '/libri', @item.id

  url_giunti: (e) ->
    e.preventDefault()
    $('input[name=remote_image_url]').val "http://catalogo.giunti.it/librig/#{ $('input[name=cm]').val()}.jpg"

class Main extends Spine.Stack
  controllers:
    edit:  Edit
    show:  Show

  className: 'stack main'
    
window.Main = Main