Feature: Data driven – Add headers – Modify json template

Scenario Outline: Make request with different travelers
  Given I have set a connection to EXAMPLE service
  When I set headers values :
  | Content-Type     | application/json                              |
  | Accept           | application/json, text/javascript, */*; q=0.01|
  | EXAMPLE-Traveler | <Traveler>                                    |
  | X-EXAMPLE-ASYNC  | true                                          |

    And I send a POST request to "/quotes" for TRAVEL with values
    |GROUP_NAME|<GROUP_NAME>|
    |ORIGIN_1|<ORG_1>|
    |DESTINATION_1|<DEST_1>|
    |DEPART_DATE_1|<DEPT_1>|
    |ORIGIN_2|<ORG_2>|
    |DESTINATION_2|<DEST_2>|
    |DEPART_DATE_2|<DEPT_2>|
    |ORIGIN_3|<ORG_3>|
    |DESTINATION_3|<DEST_3>|
    |DEPART_DATE_3|<DEPT_3>|

  Then I expect HTTP status code 201
    And I keep the "id" as "$id" from JSON response 

  When I send GET requests to "/quotes" with "$id" until the json at "status" matches "COMPLETED"
  Then I expect HTTP code 200
    And I validate the response of the "id" displayed is "$id"
    And I validate the response of the "CodeResponse" displayed is "<CODE_GEN>"

    Examples:
    |Traveler         |GROUP_NAME|ORG_1|DEST_1|DEPT_1  |ORG_2|DEST_2|DEPT_2   |ORG_3|DEST_3|DEPT_3   |CODE_GEN|
    |XXXX123456|Example1          |CBA     |LPZ       |20170112|SCZ     |TJA       |20171002|TRN     |LPZ       |20171205|AAAAA123   |
    # |YYYY123456|Example2          |TJA      |SCR      |20181201|CBA     |TRN      |20181210|LPZ      |CBA      |20181215|AABB4123   |