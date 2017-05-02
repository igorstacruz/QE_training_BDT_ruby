# Author::    Marcelo Vargas  (mailto:marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributed under the same terms as Ruby

Feature: Docs strings
  The "Withdraw Cash" menu contains several fixed amounts to
  speed up transactions for users.

Scenario: Ban Unscrupulous Users
When I behave unscrupulously

Then I should receive an email containing:
"""
Dear Sir,
Your account privileges have been revoked due to your unscrupulous behavior.
Sincerely,
The Management
"""
