Feature: Gerar Token

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

  @smoke
  Scenario: Gerar token com sucesso
    # Executa independentemente de TAG
    * def dados_usuario = call read('classpath:features/account/criar-usuario.feature')

    # Pegar nome do usuário (Gerado da feature anterior)
    * def nome = dados_usuario.login.userName

    # Pegar senha do usuário (Gerado do feature anterior)
    * def senha = dados_usuario.login.password

    # Criação de novo JSON para buscar dados
    * def login_usuario = read('classpath:features/account/arquivosJson/token-usuario.json')

    Given path 'Account/v1/GenerateToken'
    And request login_usuario
    When method post
    # Validar se foi recebido o valor (caso não, será nulo e retornará erro)
    And assert response.token != null
    Then status 200
    And def autenticador = response.token

    # Token sendo recebido corretamente
    And print autenticador