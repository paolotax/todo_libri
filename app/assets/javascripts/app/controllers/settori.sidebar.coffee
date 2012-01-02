$ = jQuery.sub()
Settore = App.Settore

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Settore.find(elementID)

class Sidebar extends Spine.Controller
  
  className: 'sidebar'
    
  elements:
    '.items': 'items'
    'input': 'search'

  events:
    'keyup input': 'filter'
    'click .item': 'show'
    'click footer button': 'create'

  constructor: ->
    super
    @html @view('settori/sidebar')()
    
    @list = new Spine.List
      el: @items, 
      template: @view('libri/item'), 
      selectFirst: true
    console.log "created sidebar"
      
    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Libro.find(params.id))   
      
  filter: (e) ->
    @query = @search.val()
    @render() 

  render: =>
    libri = Libro.filter(@query)
    @list.render(libri)
    # libri = Libro.filter(@query).sort(Libro.titoloSort)
    # @items.html ""
    # for item in libri
    #   # console.log libri.length
    #   @items.append @view('libri/item')(item)

    # @html @view('libri/index')(libri: libri)
  
  show: (e) =>
    $('.item').removeClass("active")
    item = $(e.target).item()
    $(e.target).addClass("active")
    @navigate '/libri', item.id
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/libri', item.id, 'edit'
  
  create: ->
    @navigate('/libri/new')


window.Sidebar = Sidebar