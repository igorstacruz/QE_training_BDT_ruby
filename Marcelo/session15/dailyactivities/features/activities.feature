Feature: Daily Activities

Background: Go to the work
	Given I drive 7.1 kms to the work
	When I enter to the parking area
	Then I am at work

Scenario: Have breakfast
	Given I am in the cafeteria
	When I pay $3 for cake
		And I pay $1 for oats
	Then I have a breakfast

Scenario: Attend morning meetings
	Given I have the following availability in my calendar:
	|        | Monday | Tuesday | Wednesday | Thursday | Friday |
	| 9:00   |        |         |           |          |        |
	| 9:30   |        |         |           |          |        |
	| 10:00  |        |         |           |          |        |
	| 10:30  |        |         |           |          |        |
	| 11:00  |        |         |           |          |        |
	| 11:30  |        |         |           |          |        |
	| 12:00  |        |         |           |          |        |
	| 12:30  |        |         |           |          |        |
	| 13:00  |        |         |           |          |        |
	| 13:30  |        |         |           |          |        |
	| 14:00  |        |         |           |          |        |
	| 14:30  |        |         |           |          |        |
	| 15:00  |        |         |           |          |        |
	| 15:30  |        |         |           |          |        |
	| 16:00  |        |         |           |          |        |
	When I go to have scrum meeting on Monday at 9:00
		And I go to have sync meeting on Monday at 15:30
		And I go to have retrospective meeting on Tuesday at 11:00
		And I go to have planning meeting on Wednesday at 15:30
		And I go to have client meeting on Thursday at 14:00
		And I go to have local meeting on Thursday at 16:00
		And I go to have scrum meeting on Friday at 9:00
	Then my calendar should look like this:
	|        | Monday | Tuesday | Wednesday | Thursday | Friday |
	| 9:00   |   x    |         |           |          |   x    |
	| 9:30   |        |         |           |          |        |
	| 10:00  |        |         |           |          |        |
	| 10:30  |        |         |           |          |        |
	| 11:00  |        |    x    |           |          |        |
	| 11:30  |        |         |           |          |        |
	| 12:00  |        |         |           |          |        |
	| 12:30  |        |         |           |          |        |
	| 13:00  |        |         |           |          |        |
	| 13:30  |        |         |           |          |        |
	| 14:00  |        |         |           |     x    |        |
	| 14:30  |        |         |           |          |        |
	| 15:00  |        |         |           |          |        |
	| 15:30  |   x    |         |     x     |          |        |
	| 16:00  |        |         |           |     x    |        |

Scenario: Have lunch
	Given I have the following availability to have lunch:
	|        | Monday | Tuesday | Wednesday | Thursday | Friday |
	| 11:30  |        |         |           |          |        |
	| 12:00  |        |         |           |          |        |
	| 12:30  |        |         |           |          |        |
	| 13:00  |        |         |           |          |        |
	| 13:30  |        |         |           |          |        |
	When I go to have lunch on Monday at 12:00
		And I go to have lunch on Tuesday at 12:00
		And I go to have lunch on Wednesday at 12:30
		And I go to have lunch on Thursday at 13:30
		And I go to have lunch on Friday at 13:00
	Then my lunch time should look like this:
	|        | Monday | Tuesday | Wednesday | Thursday | Friday |
	| 11:30  |        |         |           |          |        |
	| 12:00  |   x    |    x    |           |          |        |
	| 12:30  |        |         |     x     |          |        |
	| 13:00  |        |         |           |          |    x   |
	| 13:30  |        |         |           |     x    |        |