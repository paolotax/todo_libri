$ = jQuery.sub()
Libro = App.Libro

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Libro.find(elementID)

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
    @html @view('libri/sidebar')()    

    Libro.bind 'fetch', =>
      @el.addClass('loading')

    Libro.bind 'refresh', (e) =>
      @el.removeClass('loading')
      @render(arguments...)

    Libro.bind 'change', (item) => 
      it = $(".item[data-id='#{item.id}']")
      it.replaceWith(@view('libri/item')(item))

       
  filter: (e) ->
    @query = @search.val()
    @render() 

  render: (items = []) =>
    libri = Libro.filter(@query).sort(Libro.titoloSort)
    @items.html ""
    for item in libri
      # console.log libri.length
      @items.append @view('libri/item')(item)

    # @html @view('libri/index')(libri: libri)
  
  show: (e) =>
    $('.item').removeClass("active")
    item = $(e.target).item()
    $(e.target).addClass("active")
    @navigate '/libri', item.id
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/libri', item.id, 'edit'


window.Sidebar = Sidebar