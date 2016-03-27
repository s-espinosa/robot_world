class RobotAnalytics
  attr_reader :robot_directory

  def initialize(robot_directory)
    @robot_directory = robot_directory
  end

  def average_age
    robot_directory.all.map do |robot|
      robot.age
    end.reduce(:+).to_f / robot_directory.count
  end

  def by_year_hired
    robots_by("date_hired").reduce(Hash.new(0)) do |hash, (date, count)|
      hash[date.year] = count
      hash
    end
  end

  def by_department
    robots_by("department")
  end

  def by_city
    robots_by("city")

  end

  def by_state
    robots_by("state")
  end

  private
  def robots_by(category)
    robot_directory.all.reduce(Hash.new(0)) do |hash, robot|
      hash[robot.send(category)] += 1
      hash
    end
  end
end
