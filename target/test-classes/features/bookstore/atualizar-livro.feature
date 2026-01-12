Feature: Atualizar livro

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

    * def dados = call read('classpath:features/bookstore/adicionar-livro.feature')

    * def token = dados.resultado.token
    * def userID = dados.resultado.userID
    # Autorização do usuário criado na feature anterior
    * header Authorization = 'Bearer ' + token


  Scenario: Atualizar livro com sucesso
    # Alteração manual de livro ao usuário
    Given path 'BookStore/v1/Books/' + "9781491904244"
    And request
  """
  {
    "userId": "#(userID)",
    "isbn": "9781449365035"
  }
  """
    When method put
    Then status 200
    And print response
    # Validar array da response API
    And match response.books[0].isbn == '#string'


  Scenario: Atualizar livro sem userID
    # Alteração manual de livro ao usuário
    Given path 'BookStore/v1/Books/' + "9781491904244"
    And request
  """
  {
    "userId": "eric123",
    "isbn": "9781449365035"
  }
  """
    When method put
    Then status 401
    And print response
