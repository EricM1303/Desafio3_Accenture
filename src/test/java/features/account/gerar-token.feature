Feature: Gerar Token

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

  @executar
  Scenario Outline: Gerar token com sucesso
    # Invocando dados da feature anterior | Executa independentemente de TAG
    * def dados_usuario = <reusoFeature>

    # Pegar nome do usuário (Gerado da feature anterior)
    * def nome = dados_usuario.login.userName

    # Pegar senha do usuário (Gerado do feature anterior)
    * def senha = dados_usuario.login.password

    # Criação de novo JSON para buscar dados
    * def login_usuario = <tokenUsuarioJson>

    Given path 'Account/v1/GenerateToken'
    And request login_usuario
    When method post
    # Validar se foi recebido o valor (caso não, será nulo e retornará erro)
    And assert response.token != null
    Then status 200
    And def autenticador = response.token

    # Token sendo recebido corretamente
    And print autenticador

    Examples:
      | tokenUsuarioJson                                                   |  | reusoFeature                                                  |
      | read('classpath:features/account/arquivosJson/token-usuario.json') |  | call read('classpath:features/account/criar-usuario.feature') |
