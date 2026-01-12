Feature: Buscar livros por ID

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


    Scenario: Buscar catálogo com sucesso
      Given path 'BookStore/v1/Book'
      * def isbn_livro = "9781449331818"
      # Parâmetro para inserir isbn do livro no header
      And param ISBN = isbn_livro
      When method get
      Then status 200

    Scenario: Falhar na busca de catálogo
      Given path 'BookStore/v1/Book'
      And param ISBN = null
      When method get
      Then status 400