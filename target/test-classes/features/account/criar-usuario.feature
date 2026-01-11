Feature: Criar Usuário

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


  Scenario Outline: <nome-do-cenario>
    # Determinar caminho da pasta UTILS (Clean code)
    * def Utils = Java.type('features.support.utils.Utils')

    # Pegar dado aleatorizado do código JAVA em UTILS
    * def nome = Utils.gerarNome()

    # Mesma funcionalidade, mas para senhas
    * def senha = Utils.gerarSenha()

    # Incluindo esses dados capturados no JSON existente
    * def requestBody = <json-usuario>

    Given path 'Account/v1/User'
    When request requestBody
    Then method post
    And status <status-esperado>

    * def login = <json-usuario>

    Examples:
      | status-esperado |  | nome-do-cenario           |  | json-usuario                                                       |
      | 201             |  | Criar usuário com sucesso |  | read('classpath:features/account/arquivosJson/criar-usuario.json') |
