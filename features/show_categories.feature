Feature: Write Articles
  As a blog administrator
  In order to group the posts of my blog
  I want to be able to see created categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully write articles
    Given I am on the admin dashboard page
    When I follow "Categories"
    Then I should see "Categories"
    And I should see "Keywords"
    