class App.Libro extends Spine.Model
  @configure 'Libro', 'titolo', 'cm', 'ean', 'prezzo_copertina', 'prezzo_consigliato', 'settore_id', 'coefficente'
  @extend Spine.Model.Ajax

  @url: "/libri"
  
  @titoloSort: (a,b) ->
    if a.titolo is b.titolo 
      return 0
    if a.titolo < b.titolo 
      return -1 
    else 
      return 1

  @filter: (query, field) ->
    return @all() unless query
    query = query.toLowerCase()

    @select (item) ->
      if field?
        item[field]?.toLowerCase() is query
      else
        item.titolo?.toLowerCase().indexOf(query) isnt -1  # or
          #item[field]?.toLowerCase().indexOf(query) isnt -1