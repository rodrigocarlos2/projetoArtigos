Feature: Adicionar artigos
  Como usuario
  Eu quero adicionar artigos na pagina
  Para eu poder vizualizar depois
  
  Scenario: Adicionando artigos
    Given I am on the home page
    And I am authenticated
    Given I visit the new example page
    When I fill the new product form with IFPI as Nome and Concurso1 as the Pasta and /home as the Arquivo
    And click on the 'Create' button
    And I fill in the fields
    Then I should see the article in the list
  
  