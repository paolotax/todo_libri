class App.Libro extends Spine.Model
  @configure 'Libro', 'titolo', 'cm', 'ean', 'prezzo_copertina', 'prezzo_consigliato', 
    'settore_nome', 'coefficente', 'image', 'remote_image_url', 'materia_id', 'remove_image'
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
  
  validate: () ->
    error = { errors: [] }
    unless @titolo
      error.titolo = "Il titolo non deve essere lasciato in bianco"
      error.errors.push ['titolo']
    unless @prezzo_copertina
      error.prezzo_copertina =  "Il prezzo di copertina non deve essere lasciato in bianco" 
      error.errors.push ['prezzo_copertina']
    unless @prezzo_consigliato
      error.prezzo_consigliato =  "Il prezzo consigliato non deve essere lasciato in bianco"
      error.errors.push ['prezzo_consigliato']
    unless @settore_nome
      error.settore_nome =  "Il settore non deve essere lasciato in bianco"
      error.errors.push ['settore_nome']
    if error.errors.length is 0 
      return null
    else return error
  
