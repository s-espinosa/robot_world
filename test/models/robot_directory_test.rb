require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    create_robots(1)

    robot = robot_directory.all.last

    assert_equal "Name 1", robot.name
    assert_equal "State 1", robot.state
  end

  def test_it_can_find_all_tasks
    create_robots(3)

    all_robots = robot_directory.all

    assert_kind_of Array, all_robots
    assert_equal 3, all_robots.count
    assert_equal "Name 1", all_robots.first.name
    assert_equal "Name 3", all_robots.last.name
  end

  def test_it_can_find_a_specific_task
    create_robots(5)

    robot1_id = robot_directory.all[-5].id.first
    robot1    = robot_directory.find(robot1_id)

    assert_equal "Name 1", robot1.name
    assert_equal "State 1", robot1.state

    robot3_id = robot_directory.all[-3].id.first
    robot3    = robot_directory.find(robot3_id)

    assert_equal "Name 3", robot3.name
    assert_equal "City 3", robot3.city
  end

  def test_it_can_update_an_existing_robot
    create_robots(1)

    robot = robot_directory.all[-1]

    assert_equal "Name 1", robot.name
    assert_equal "Avatar 1", robot.avatar

    id_to_update = robot_directory.all[-1].id
    robot_directory.update(id_to_update, updated_robot_input)

    robot = robot_directory.all[-1]

    assert_equal "Updated Name", robot.name
    assert_equal "Updated Department", robot.department
  end

  def test_it_can_destroy_a_robot
    create_robots(1)

    all_robots = robot_directory.all

    assert_equal 1, all_robots.count
    assert all_robots.any? { |robot| robot.name == "Name 1" }

    id_to_destroy = robot_directory.all[-1].id
    robot_directory.destroy(id_to_destroy)

    all_robots = robot_directory.all

    assert_equal 0, all_robots.size
    refute all_robots.any? { |robot| robot.name == "Name 1" }
  end
end
