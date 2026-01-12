Feature: Criar Usuário

  Background:
    Given url baseUrl
    * header Content-Type = 'application/json'
    * def Utils = Java.type('features.support.utils.Utils')
    # Pegar dado aleatorizado do código JAVA em UTILS
    * def nome = Utils.gerarNome()

  Scenario Outline: <nomeCenario>
    # Gerar senha aleatória com requisitos exigidos
    * def senha = Utils.gerarSenha()

    # Incluindo esses dados capturados no JSON existente
    * def requestBody = <jsonUsuarioGerado>

    Given path 'Account/v1/User'
    When request requestBody
    Then method post
    And status <statusEsperado>

    * def login = <jsonUsuarioGerado>

    Examples:
      | statusEsperado |  | nomeCenario               |  | jsonUsuarioGerado                                                  |
      | 201            |  | Criar usuário com sucesso |  | read('classpath:features/account/arquivosJson/criar-usuario.json') |


  Scenario: Criar usuário com senha inválida
    # Determinar caminho da pasta UTILS (Clean code)
    * def senha = Utils.gerarSenha()

    # Incluindo esses dados capturados no JSON existente
    * def requestBody = { "userName": #(nome), "password": #(senha) }

    Given path 'Account/v1/User'
    When request requestBody
    Then method post
    And status 201

    * def login = requestBody