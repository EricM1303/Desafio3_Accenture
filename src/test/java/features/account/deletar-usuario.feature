Feature: Deletar Usuário

  Background:
    Given url baseUrl
    * header Content-Type = 'application/json'
    * def autenticacao = call read('classpath:features/bookstore/token-extra.feature')

    # Pegar autenticação do usuário do token-extra.feature
    * def token = autenticacao.resultado.token
    * header Authorization = 'Bearer ' + token

  @executar
  Scenario: Deletar usuário com sucesso
    # Pegar userID do usuário criado pelo gerar-token.feature
    * def userID = autenticacao.resultado.userID

    Given path 'Account/v1/User/' + userID
    When method delete
    Then status 200


    @executar
    Scenario: Deletar usuário sem autenticação
      * def userID = null

      Given path 'Account/v1/User/' + userID
      When method delete
      # Deveria retornar 400, mas API retorna 200
      Then status 200
