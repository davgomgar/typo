Feature: Merge Articles
  As an author
  In order to cleanup the mess in my blog
  I want to merge articles

  Scenario: Administrator can see merge articles option in edit article page
    Given the logged user is an admin
    And I am on the edit article 1 page
    Then I should see "Merge Articles"

  Scenario: Administrator cannot see merge articles option in new article page
    Given the logged user is an admin
    And I am on the new article page
    Then I should not see "Merge Articles"

  Scenario: A Non Administrator cannot see merge articles option in edit article page
    Given the logged user is not an admin
    And I am on the edit article 1 page
    Then I should not see "Merge Articles"

  Scenario: A Non Administrator cannot see merge articles option in a new article page
    Given the logged user is not an admin
    And I am on the new article page
    Then I should not see "Merge Articles"


 


 