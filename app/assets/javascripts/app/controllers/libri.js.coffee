$ = jQuery.sub()
Libro = App.Libro

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Libro.find(elementID)



class App.Libri extends Spine.Controller
  className: 'libri'
    
  constructor: ->
    super
    
    @sidebar = new Sidebar
    @main    = new Main
     
    @routes
      'libri': (params) ->
        @sidebar.active(params)
      
      '/libri/:id': (params) ->
        @sidebar.active(params)
        @main.show.active(params)
      
      '/libri/:id/edit': (params) -> 
        @sidebar.active(params)
        @main.edit.active(params)
    
    divide = $('<div />').addClass('vdivide')

    @append @sidebar , divide, @main

    Libro.fetch()

