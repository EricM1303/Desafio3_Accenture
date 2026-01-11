Feature: Gerar Token

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


  Scenario Outline: Gerar token com sucesso
    * def dados_usuario = <reusoFeature>

    * def nome = dados_usuario.login.userName
    * def senha = dados_usuario.login.password

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
    And assert response.token != null

    # Variável a ser chamada no próximo call (para fazer autorizações do usuário)
    * def resultado =
    """
  {
    "token": #(response.token),
    "userID": #(dados_usuario.response.userID)
  }
  """
    Examples:
      | reusoFeature                                                  |
      | call read('classpath:features/account/criar-usuario.feature') |
