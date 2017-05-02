# Author::    Marcelo Vargas  (mailto:marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributed under the same terms as Ruby

Feature: Nested Steps 
  Neste steps

Scenario: Successful login with PIN
  Given I have pushed my card in the slot
  Given I have authenticated with the correct PIN

Scenario: Withdraw fixed amount of $50
  Given an activated customer MARCELO exists
  Given I have $500 in my account
  Given I have authenticated with the correct PIN
  When I choose to withdraw the fixed amount of $50
  Then I should receive $50 cash
  And the balance of my account should be $450