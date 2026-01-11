Feature: Listar todos produtos

  Background:
    Given url baseUrl


  Scenario Outline: <descricao-cenario>
    Given path "/produtos"
    When method get
    Then status <status-esperado>
    And print response


    Examples:
      | descricao-cenario                      | status-esperado |
      | Listar tod  os os produtos com sucesso | 200             |


  Scenario: Listar produtos no carrinho
    Given path "/carrinhos"
    When method get
    Then status 200
    And print response