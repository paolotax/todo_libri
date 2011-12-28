#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  constructor: ->
    super
    
    console.log @el.context
    @libri = new App.Libri
    @settori = new App.Settori(el: $(".settori"))
    
    @append @libri
    @append @settori
    
    # @routes
    #   '/settori': -> console.log 'settoriiii'
    #   '/libri':   -> console.log 'libriii'
    
    
    # if @el.context.URL.match /libri/
    #       console.log 'libri'
    #       @append @libri
    #     else
    #       console.log 'settori'
    #       @append @settori
    
    
    

    Spine.Route.setup()    

window.App = App