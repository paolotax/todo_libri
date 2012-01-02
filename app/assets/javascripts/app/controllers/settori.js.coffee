$ = jQuery.sub()
Settore = App.Settore

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Settore.find(elementID)


class App.Settori extends Spine.Controller
  className: 'settori'
    
  constructor: ->
    super
    
    @sidebar = new Sidebar
    # @main    = new Main
     
    @routes

      '/settori/new': (params) ->
        @sidebar.active(params) 
        @main.new.active(params)
      
      '/settori/:id': (params) ->
        @sidebar.active(params)
        @main.show.active(params)
      
      '/settori/:id/edit': (params) -> 
        @sidebar.active(params)
        @main.edit.active(params)

      '/settori': (params) ->
        @sidebar.active(params)    
    
    Settore.bind "destroy", (rec) ->
      $(".item[data-id=#{rec.id}]").remove()
      
    Settore.bind "error", (rec, msg) ->
      for error in msg.errors
        $("input[name=#{error}], select[name=#{error}]").addClass 'validation_error'
        $("input[name=#{error}]").attr 'placeholder', msg[error]
    
    $('input[required], select[required]').live 'change', ->
      $(@).removeClass('validation_error')
      
    divide = $('<div />').addClass('vdivide')

    @append @sidebar , divide #, @main

    Settore.fetch()


# class New extends Spine.Controller
#   events:
#     'click [data-type=back]': 'back'
#     'submit form': 'submit'
#     
#   constructor: ->
#     super
#     @active @render
#     
#   render: ->
#     @html @view('settori/new')
# 
#   back: ->
#     @navigate '/settori'
# 
#   submit: (e) ->
#     e.preventDefault()
#     settore = Settore.fromForm(e.target).save()
#     @navigate '/settori', settore.id if settore
# 
# class Edit extends Spine.Controller
#   events:
#     'click [data-type=back]': 'back'
#     'submit form': 'submit'
#   
#   constructor: ->
#     super
#     @active (params) ->
#       @change(params.id)
#       
#   change: (id) ->
#     @item = Settore.find(id)
#     @render()
#     
#   render: ->
#     @html @view('settori/edit')(@item)
# 
#   back: ->
#     @navigate '/settori'
# 
#   submit: (e) ->
#     e.preventDefault()
#     @item.fromForm(e.target).save()
#     @navigate '/settori'
# 
# class Show extends Spine.Controller
#   events:
#     'click [bata-type=edit]': 'edit'
#     'click [data-type=back]': 'back'
# 
#   constructor: ->
#     super
#     @active (params) ->
#       @change(params.id)
# 
#   change: (id) ->
#     @item = Settore.find(id)
#     @render()
# 
#   render: ->
#     @html @view('settori/show')(@item)
# 
#   edit: ->
#     @navigate '/settori', @item.id, 'edit'
# 
#   back: ->
#     @navigate '/settori'
# 
# class Index extends Spine.Controller
#   events:
#     'click [data-type=edit]':    'edit'
#     'click [data-type=destroy]': 'destroy'
#     'click [data-type=show]':    'show'
#     'click [data-type=new]':     'new'
# 
#   constructor: ->
#     super
#     console.log 'index'
#     Settore.bind 'refresh change', @render
#     Settore.fetch()
#     
#   render: =>
#     settori = Settore.all()
#     @html @view('settori/index')(settori: settori)
#     
#   edit: (e) ->
#     item = $(e.target).item()
#     @navigate '/settori', item.id, 'edit'
#     
#   destroy: (e) ->
#     item = $(e.target).item()
#     item.destroy() if confirm('Sure?')
#     
#   show: (e) ->
#     item = $(e.target).item()
#     @navigate '/settori', item.id
#     
#   new: ->
#     @navigate '/settori/new'
#     
# class App.Settori extends Spine.Stack
#   controllers:
#     index: Index
#     edit:  Edit
#     show:  Show
#     new:   New
#     
#   routes:
#     '/settori/new':      'new'
#     '/settori/:id/edit': 'edit'
#     '/settori/:id':      'show'
#     '/settori':          'index'
#     
#   default: 'index'
#   className: 'stack settori'