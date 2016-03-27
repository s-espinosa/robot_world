class RobotAnalytics
  attr_reader :robot_directory

  def initialize(robot_directory)
    @robot_directory = robot_directory
  end

  def average_age
    robot_directory.all.map do |robot|
      robot.age
    end.reduce(:+) / robot_directory.count
  end

end
