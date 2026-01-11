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
    * def requestBody = read('classpath:features/account/arquivosJson/criar-usuario.json')

    Given path 'Account/v1/User'
    When request requestBody
    Then method post
    And status <status-esperado>

    * def login = { userName: #(nome), password: #(senha) }

    Examples:
      | status-esperado |  | nome-do-cenario           |
      | 201             |  | Criar usuário com sucesso |
