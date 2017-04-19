Feature: Daily Activites

Scenario: automate a testcase
  Given "TC001" manual test
  Then the test is automated

Scenario: write daily report
  Given manual test automated
  Then the report should look like:
    |id   |status  |
    |TC001|complete|
