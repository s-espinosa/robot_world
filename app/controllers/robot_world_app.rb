class RobotWorldApp < Sinatra::Base
  attr_reader :robot_directory

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_directory.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_directory.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_directory.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_directory.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_directory.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_directory.destroy(id.to_i)
    redirect "/robots"
  end

  def robot_directory
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite('db/robot_directory_test.sqlite')
    else
      database = Sequel.sqlite('db/robot_directory_development.sqlite')
    end
    @robot_directory ||= RobotDirectory.new(database)
  end
end
