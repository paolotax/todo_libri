#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route
#= require spine/list

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views



class App extends Spine.Controller
  constructor: ->
    super
    
    console.log @el.context
    # @libri = new App.Libri
    @settori = new App.Settori
    
    # @append @libri
    # @append @settori
    
    # @routes
    #   '/settori': -> console.log 'settoriiii'
    #   '/libri':   -> console.log 'libriii'
    
    
    if @el.context.URL.match /settori/
      console.log 'settori'
      @append @settori
    else
      console.log 'libri'
      # @append @libri

    Spine.Route.setup()    

window.App = App