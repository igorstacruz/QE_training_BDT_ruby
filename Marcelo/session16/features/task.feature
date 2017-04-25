# Author::    Marcelo Vargas  (marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributed under the same terms as Ruby

Feature: Search
  Search search

@outline
Scenario Outline: Withdraw fixed amount
  Given I have <Name>, <ID> and <Total Priced> of the client
  Examples:  
  |    Name    |   ID    | Total Priced |
  | Juan       | 132     |    $560      |
  | Pepito     | 555     |    $110      |
  | Luis       | 1024    |    $70       |
  | Chavito    | 34      |    $45       |

@normal
Scenario: Search of a client
  Given I have a list of clients
  When I search a client by ID 555
  Then I should get if the client exists