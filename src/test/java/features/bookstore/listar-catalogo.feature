Feature: Listar catálogo de livros

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


    Scenario: Listar catálogo com sucesso
      Given path '/BookStore/v1/Books'
      When method get
      Then status 200


    Scenario: Listar catálogo e validar response
      Given path '/BookStore/v1/Books'
      When method get
      Then status 200
      # Validar se é array o response de books
      And match response.books == '#array'