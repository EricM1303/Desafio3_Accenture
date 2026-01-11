Feature: Buscar livros por ID

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'
    * def isbn_livro = "9781449331818"
    # Parâmetro para isbn do livro no header
    And param ISBN = isbn_livro

    @executar
    Scenario: Buscar livro com sucesso
      Given path 'BookStore/v1/Book'
      When method get
      Then status 200