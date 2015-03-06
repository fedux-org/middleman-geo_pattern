Feature: Generate GeoPattern
  As a web designer
  I would like to use a geo pattern within a view
  In order to have a beautiful background

  Background:
    Given a fixture app "empty-app"
    And a source file named "layouts/layout.erb" with:
    """
    <html>
      <head>
        <title>Test</title>
      </head>
      <body>
        <%= yield %>
      </body>
    </html>
    """

  Scenario: Simple string
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    background-image:
    """

  Scenario: Set default patterns
    Given a middleman config file with:
    """
    activate :geo_pattern do |e|
      e.default_patterns = [:xes]
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see a geo pattern based on "Mastering Markdown" with patterns "xes" with color "#3f904d"

  Scenario: Set default color
    Given a middleman config file with:
    """
    activate :geo_pattern do |e|
      e.default_color = '#fff'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see a geo pattern based on "Mastering Markdown" with patterns "hexagons" with color "#fff"

  Scenario: Set default base color
    Given a middleman config file with:
    """
    activate :geo_pattern do |e|
      e.default_base_color = '#123456'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see a geo pattern based on "Mastering Markdown" with patterns "hexagons" with color "#541428"

  Scenario: Set tag as string
    Given a middleman config file with:
    """
    activate :geo_pattern do |e|
      e.html_tag = 'span'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    span
    """

  Scenario: Set tag as string
    Given a middleman config file with:
    """
    activate :geo_pattern do |e|
      e.html_tag = :span
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    span
    """

  Scenario: Use block
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <% geo_pattern('Mastering Markdown') do %>
      <%= content_tag :h1, 'Mastering Markdown' %>
    <% end %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    <h1>
    """