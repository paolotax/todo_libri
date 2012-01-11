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
    @settori = new App.Settori    
    @libri = new App.Libri
    
    if @el.context.URL.match /settori/
      @append @settori
    else
      @append @libri

    Spine.Route.setup()    

window.App = App