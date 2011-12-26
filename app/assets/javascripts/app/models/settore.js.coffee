class App.Settore extends Spine.Model
  @configure 'Settore', 'nome'
  @extend Spine.Model.Ajax
  
  @url: "/settori"
  
  @nomeSort: (a,b) ->
    if a.nome is b.nome 
      return 0
    if a.nome < b.nome 
      return -1 
    else 
      return 1