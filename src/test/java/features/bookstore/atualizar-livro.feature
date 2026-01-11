Feature: Atualizar livro

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

    * def dados = call read('classpath:features/bookstore/adicionar-livro.feature')

    * def token = dados.resultado.token
    * def userID = dados.resultado.userID
    * def isbn = dados.resultado.isbn

    * header Authorization = 'Bearer ' + token



  Scenario: Atualizar livro com sucesso
    Given path 'BookStore/v1/Books/' + "9781449365035"
    And request
  """
  {
    "userId": "#(userID)",
    "isbn": "#(isbn)"
  }
  """
    When method put
    Then status 200
    And print response