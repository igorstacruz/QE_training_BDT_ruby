# Author::    Marcelo Vargas  (mailto:marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributed under the same terms as Ruby

Feature: Doc strings
  Description of doc strings.

Scenario: Validate doc strings
  When I ask to reset my password
  Then I should receive an email with:
    """
    Dear kari,

    Please click this link to reset your password
    """