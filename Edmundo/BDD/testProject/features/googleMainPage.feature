#
#

Feature: Test google main page

Scenario: Search for an entry
  Given Loged into google main page
  When is typed "cucumber" into the search box
    And press Enter
  Then the page should show "https://cucumber.io/" entry

Scenario: Verify the search box is displayed
  Given The user in on google main page
  Then the search box should be displayed
    And is located at the center of the page

Scenario: Verify the feeling good button
  Given The user in on google main page
  Then the feeling good button is displayed
    And is located below the search box
    And near to Google Search button
