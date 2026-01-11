Feature: Listar catálogo de livros

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


    Scenario Outline: Listar catálogo com sucesso
      Given path '/BookStore/v1/Books'
      When method get
      Then status <statusCode>


    Scenario Outline: Listar catálogo e validar response
      Given path '/BookStore/v1/Books'
      When method get
      Then status <statusCode>
      # Validar se é array o response de books
      And match response.books == '#array'

      Examples:
      |statusCode|
      |200       |