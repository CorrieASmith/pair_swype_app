require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'sinatra/base'

before do
  Cohort.first_or_create({language: 'Ruby', trimester: 2, year: 2015})
  Cohort.first_or_create({language: 'PHP', trimester: 2, year: 2015})
  Cohort.first_or_create({language: 'Java', trimester: 2, year: 2015})
end

enable :sessions

helpers do

  def login?
    if session[:username].nil?
      return false
    else
      return true
    end
  end

  def username
    return session[:username]
  end

end


get('/') do
  erb(:index)
end

get('/sessions/new') do
  erb(:user_login)
end

post('/sessions') do
  email = params.fetch("email")
  user = User.find_by email: email
  id = user.id
  session[:user_id] = id
  redirect("/users/#{id}")
end

get('/users/new') do
  @cohorts = Cohort.all
  erb(:add_user)
end

post('/users') do
  name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  email = params.fetch("email")
  password = params.fetch("password")
  cohort_id = params["cohort_id"].to_i
  user = User.create({:name => name, :last_name => last_name, :email => email, :password => password, :cohort_id => cohort_id})
  id = user.id
  redirect("/users/#{id}")
end

get('/users/:id') do
  id = params.fetch('id').to_i
  @user = User.find(id)
  erb(:user_detail)
end

delete('/users/:id') do
  id = params.fetch('id').to_i
  user = User.find(id)
  user.destroy
  redirect('/')
end
