Feature: Gerar Token

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'
    * def dados_usuario = call read('classpath:features/account/criar-usuario.feature')

    # Pegar nome do usuário de criar-usuario.feature
    * def nome = dados_usuario.login.userName
    # Pegar nome do usuário de criar-usuario.feature
    * def senha = dados_usuario.login.password


  Scenario: Gerar token com sucesso
    Given path 'Account/v1/GenerateToken'

    # Gerar JSON de forma mais injetável (por arquivo, não fica dinâmico como deveria)
    And request
    """
    {
      "userName": "#(nome)",
      "password": "#(senha)"
    }
    """
    When method post
    Then status 200

    # Verificar se código retorna com token (false = null)
    And assert response.token != null

    # Variável a ser chamada no próximo call (para fazer autorizações do usuário)
    * def resultado =
    """
  {
    "token": #(response.token),
    "userID": #(dados_usuario.response.userID)
  }
  """

