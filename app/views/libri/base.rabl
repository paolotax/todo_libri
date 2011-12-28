attributes :id, :titolo, :prezzo_copertina, :prezzo_consigliato, :image, :cm, :ean
glue(:settore) { attributes :nome => :settore_nome }