Feature: Adicionar livro ao usuário

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'
    * def autenticacao = call read('classpath:features/bookstore/token-extra.feature')

    # Puxar token da feature que cria token e usuário
    * def token = autenticacao.resultado.token
    # Autenticar token para realizar requisições
    * header Authorization = 'Bearer ' + token
    # Pegar userID da feature
    * def userID = autenticacao.resultado.userID

    @executar
    Scenario: Adicionar livro ao usuário com sucesso
      Given path '/BookStore/v1/Books'
      And request
      """
      {
        "userId": "#(userID)",
        "collectionOfIsbns": [
        {
            "isbn": "9781491904244"
        }
       ]
      }
      """
      Then method post
      And status 201
