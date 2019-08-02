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
  erb(:projects)
end

post('/') do
  @title = params[:title]
  @project = Project.new({:title => @title, :id => nil})
  @project.save
  redirect to ('/')
end

get('/clear') do
  Project.clear()
end
