Feature: Deletar Usuário

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


  Scenario: Deletar usuário com sucesso
    * def autenticacao = call read('classpath:features/account/gerar-token.feature')

    # Pegar autenticação do usuário do gerar-token.feature
    * def token = autenticacao.resultado.token
    # Pegar userID do usuário criado pelo gerar-token.feature
    * def userID = autenticacao.resultado.userID

    * header Authorization = 'Bearer ' + token

    Given path 'Account/v1/User/' + userID
    When method delete
    Then status 204

    @executar
    Scenario: Deletar usuário sem autenticação
      * def autenticacao = call read('classpath:features/account/gerar-token.feature')

      * def userID = autenticacao.resultado.userID

      Given path 'Account/v1/User/' + userID
      When method delete
      Then status 401
