Feature:
Background:
Given I login to the app
And a have the next activities
| Task1 |
| Task2 |
| Task3 |
| Task4 |
When I intialize the activities as:
|       | TO DO | IN PROGRESS | DONE |
| Task1 |   X   |             |      |
| Task2 |   X   |             |      |
| Task3 |   X   |             |      |
| Task4 |   X   |             |      |

Scenario: current status
Then the activites have the next status:
|       | TO DO | IN PROGRESS | DONE |
| Task1 |   X   |             |      |
| Task2 |   X   |             |      |
| Task3 |   X   |             |      |
| Task4 |   X   |             |      |

Scenario: Change stutus of tasks
When "Task1" change status to IN PROGRESS
When "Task3" change status to DONE
Then the activites have the next status:
|       | TO DO | IN PROGRESS | DONE |
| Task1 |       |      X      |      |
| Task2 |   X   |             |      |
| Task3 |       |             |   X  |
| Task4 |   X   |             |      |