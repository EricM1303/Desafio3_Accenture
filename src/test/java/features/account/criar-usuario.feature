Feature: Criar Usuário

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

  @smoke
  Scenario Outline: <nome-do-cenario>
    * def Utils = Java.type('features.support.utils.Utils')
    * def nome = Utils.gerarNome()
    * def senha = Utils.gerarSenha()
    * def requestBody = read('classpath:features/account/arquivosJson/criar-usuario.json')

    Given path 'Account/v1/User'
    When request requestBody
    Then method post
    And status <status-esperado>

    Examples:
      | status-esperado |  | nome-do-cenario           |
      | 201             |  | Criar usuário com sucesso |
