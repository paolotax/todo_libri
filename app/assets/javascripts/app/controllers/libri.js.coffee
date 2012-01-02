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

      '/libri/new': (params) ->
        @sidebar.active(params) 
        @main.new.active(params)
      
      '/libri/:id': (params) ->
        @sidebar.active(params)
        @main.show.active(params)
      
      '/libri/:id/edit': (params) -> 
        @sidebar.active(params)
        @main.edit.active(params)

      '/libri': (params) ->
        @sidebar.active(params)    
    
    Libro.bind "destroy", (rec) ->
      console.log rec.id
      $(".item[data-id=#{rec.id}]").remove()
      
    Libro.bind "error", (rec, msg) ->
      for error in msg.errors
        $("input[name=#{error}], select[name=#{error}]").addClass 'validation_error'
        $("input[name=#{error}]").attr 'placeholder', msg[error]
    
    $('input[required], select[required]').live 'change', ->
      console.log 'gino'
      $(@).removeClass('validation_error')
      
    divide = $('<div />').addClass('vdivide')

    @append @sidebar , divide, @main

    Libro.fetch()

