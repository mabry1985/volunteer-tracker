require('sinatra')
require('sinatra/reloader')
require('capybara')
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

get ('/test')do
  erb :index
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

get ('/project/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:project_edit)
end

patch ('/project/:id/edit') do
     @project = Project.find(params[:id].to_i())
     @project.update(:title => params[:title])
     redirect to ("/project/#{@project.id}")
end

delete ('/project/:id/edit') do
     @project = Project.find(params[:id].to_i())
     @project.delete
     redirect to ("/")
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

delete ('/volunteers/:id') do
     @volunteer = Volunteer.find(params[:id].to_i())
     @volunteer.delete
     redirect to ("/")
end

get('/clear') do
  Project.clear()
  Volunteer.clear()
end
