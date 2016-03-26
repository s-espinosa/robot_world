require 'yaml/store'

class RobotDirectory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
  end

  def update(id, robot)
    database.from(:robots).where(:id => id).update(robot)
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def all
    raw_robots.map do |robot|
      Robot.new(robot)
    end
  end

  def destroy(id)
    database.from(:robots).where(:id => id).delete
  end

  def destroy_all
    database.from(:robots).delete
  end

  private
  def raw_robots
    database.from(:robots).to_a
  end

  def raw_robot(id)
    database.from(:robots).where(:id => id).to_a.first
  end
end
