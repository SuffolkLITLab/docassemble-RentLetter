Feature: New owner rent letter

  @edit
  Scenario: Tenant reports repairs to a bank that bought the home
    Given I start the interview at "rent_letter.yml"
    And I wait 1 second
    And the maximum seconds for each step is 90
    When I get to "rent letter download" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | foreclosure_complete | True | |
      | users[0].name.first | Maya | |
      | users[0].name.last | Rivera | |
      | users[0].address.address | 123 Example Street | |
      | users[0].address.city | Boston | |
      | users[0].address.state | MA | |
      | users[0].address.zip | 02108 | |
      | new_owner.name.first | Example Bank | |
      | new_owner.address.address | 99 Sample Road | |
      | new_owner.address.city | Boston | |
      | new_owner.address.state | MA | |
      | new_owner.address.zip | 02109 | |
      | contact_information | Please email maya@example.com. | |
      | has_repairs | True | |
      | conditions_with_property | Water leaks through the kitchen ceiling. The front door lock is broken. | |
      | date_sent | 11/22/2026 | |
      | delivery_method | mail | |
    Then I download "letter_to_new_landlord.pdf"
    And the downloaded PDF "letter_to_new_landlord.pdf" should contain "Example Bank"
    And the downloaded PDF "letter_to_new_landlord.pdf" should contain "front door lock is broken"
    When I follow the review link containing "Edit answers"
    And I follow the review link containing "Tell the owner about repairs:"
    And I get to "rent letter review" with this data:
      | var | value | trigger |
      | has_repairs | False | |
    And I return from answer review
    Then the question id should be "rent letter download"
    When I download a fresh copy of "letter_to_new_landlord.pdf"
    Then the downloaded PDF "letter_to_new_landlord.pdf" should not contain "front door lock is broken"
    And the downloaded PDF "letter_to_new_landlord.pdf" should not contain "Please repair"

  Scenario: Tenant has no repair issues and wants replies by mail only
    Given I start the interview at "rent_letter.yml"
    And I wait 1 second
    And I use a narrow phone viewport
    And the maximum seconds for each step is 90
    When I get to "rent letter download" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | foreclosure_complete | True | |
      | users[0].name.first | Devon | |
      | users[0].name.last | Chen | |
      | users[0].address.address | 125 Example Street | |
      | users[0].address.city | Boston | |
      | users[0].address.state | MA | |
      | users[0].address.zip | 02108 | |
      | new_owner.name.first | Alex Example | |
      | new_owner.address.address | 10 Sample Road | |
      | new_owner.address.city | Boston | |
      | new_owner.address.state | MA | |
      | new_owner.address.zip | 02109 | |
      | contact_information |  | |
      | has_repairs | False | |
      | date_sent | 11/22/2026 | |
      | delivery_method | hand delivery | |
    Then I download "letter_to_new_landlord.pdf"
    And the downloaded PDF "letter_to_new_landlord.pdf" should contain "where to send my rent"
    And the downloaded PDF "letter_to_new_landlord.pdf" should not contain "Please repair"
    And the downloaded PDF "letter_to_new_landlord.pdf" should not contain "You can also reach me"
    And the interview fits the phone width
    And I take a screenshot named "rent-phone"

  Scenario: Tenant does not know whether foreclosure is complete
    Given I start the interview at "rent_letter.yml"
    And I wait 1 second
    When I get to "check the owner first" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | foreclosure_complete | False | |
    Then I should see the phrase "Check who owns your home first"
