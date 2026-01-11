Feature: Deletar Usuário

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

  @executar
  Scenario: Deletar usuário com sucesso
    * def autenticacao = call read('classpath:features/account/gerar-token.feature')

    * def token = autenticacao.resultado.token
    * def userID = autenticacao.resultado.userID

    * header Authorization = 'Bearer ' + token

    Given path 'Account/v1/User/' + userID
    When method delete
    Then status 204
