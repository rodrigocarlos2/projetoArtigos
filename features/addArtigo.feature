Feature: Adicionar artigos
  Como usuario
  Eu quero adicionar artigos na pagina
  Para eu poder vizualizar depois
  
  Scenario: Adicionando artigos
    Given I am on the home page
    And I am authenticated
    When I follw "Novo"
    And I fill in the fields
    Then I should see the article in the list
  
  