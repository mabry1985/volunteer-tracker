require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require("pg")
require('rspec')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
  erb(:index)
end

post('/project') do
  @title = params[:title]
  @project = Project.new({:title => @title, :id => nil})
  @project.save
  redirect to ('/')
end

get ('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @volunteers = Volunteer.all
  erb(:project)
end

post ('/project/:id') do
  @volunteer = Volunteer.new({:name => params[:name], :id => nil, :project_id => params[:id]})
  @volunteer.save
  redirect to ("/project/#{@volunteer.project_id}")
end

get ('/volunteers/:id') do
    @volunteer = Volunteer.find(params[:id].to_i())
    erb(:volunteer)
end

patch ('/volunteers/:id') do
     @volunteer = Volunteer.find(params[:id].to_i())
     @volunteer.update(:name => params[:name])
     redirect to ("/project/#{@volunteer.project_id}")
end

get('/clear') do
  Project.clear()
  Volunteer.clear()
end
