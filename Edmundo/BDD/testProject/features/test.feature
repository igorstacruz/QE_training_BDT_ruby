Feature: This is the feature title
This is the description of the feature, which can span multiple lines.
You can even include empty lines, like this one:

In fact, everything until the next Gherkin keyword is included in the description.
The text immediately following on the same line as the Feature keyword is the
name of the feature, and the remaining lines are its description.

Scenario: Know the names of the conference rooms
Given the engineer is loged into the system
When is typed the conference "1B2"
Then the system should show "Rohan"
