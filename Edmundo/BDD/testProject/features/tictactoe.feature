Feature: tic tac toe
Scenario: 1
  Given a board like:
    | |1|2|3|
    |1| | | |
    |2| | | |
    |3| | | |
  When player x plays in row 2, column 1
  Then the board should look like this:
    |   | 1 | 2 | 3 |
    | 1 |   |   |   |
    | 2 | x |   |   |
    | 3 |   |   |   |
  When player o plays in row 3, column 3
  Then the board should look like this:
    |   | 1 | 2 | 3 |
    | 1 |   |   |   |
    | 2 | x |   |   |
    | 3 |   |   | o |
