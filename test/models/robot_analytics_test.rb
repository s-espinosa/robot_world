require_relative '../test_helper'

class RobotAnalyticsTest < Minitest::Test
  include TestHelpers

  def test_it_can_determine_the_average_age_of_robots
    create_robots(5)
    robot_analytics = RobotAnalytics.new(robot_directory)

    assert_equal 4.0, robot_analytics.average_age
  end

  def test_it_can_determine_robots_hired_each_year
    create_robots(4)
    robot_analytics = RobotAnalytics.new(robot_directory)

    expected = {2016 => 1,
                2015 => 1,
                2014 => 1,
                2013 => 1}

    assert_equal expected, robot_analytics.by_year_hired
  end

  def test_it_can_determine_robots_by_department
    create_robots(4)
    robot_analytics = RobotAnalytics.new(robot_directory)

    expected = {"Department 1" => 1,
                "Department 2" => 1,
                "Department 3" => 1,
                "Department 4" => 1}

    assert_equal expected, robot_analytics.by_department
  end

  def test_it_can_determine_robots_by_city
    create_robots(4)
    robot_analytics = RobotAnalytics.new(robot_directory)

    expected = {"City 1" => 1,
                "City 2" => 1,
                "City 3" => 1,
                "City 4" => 1}

    assert_equal expected, robot_analytics.by_city
  end

  def test_it_can_determine_robots_by_state
    create_robots(4)
    robot_analytics = RobotAnalytics.new(robot_directory)

    expected = {"State 1" => 1,
                "State 2" => 1,
                "State 3" => 1,
                "State 4" => 1}

    assert_equal expected, robot_analytics.by_state
  end
end
