require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'sinatra/base'
require 'pry'

before do
  Cohort.where(language: 'Ruby').first_or_create({trimester: 2, year: 2015})
  Cohort.where(language: 'PHP').first_or_create({trimester: 2, year: 2015})
  Cohort.where(language: 'Java').first_or_create({trimester: 2, year: 2015})
end

enable :sessions

helpers do

  def login?
    if session[:user_id].nil?
      return false
    else
      return true
    end
  end

  def adminlogin?
    if session[:admin] == nil
      false
    else
      true
    end
  end
end



get('/') do
  if login?
    redirect("/users/#{session[:user_id]}")
  else
    erb(:index)
  end
end

########## admin ##########

get('/admin_login') do
  @admin = Admin.all
  erb(:admin_login)
end


post('/admin_login') do
  @admin = Admin.find_by_password(params["password"])
  session[:admin] = 'true'
  if @admin
    redirect("/admin")
  else
    redirect("/admin_login")
  end
  if @admin.login?
    redirect("/admin")
  else
    redirect("/admin_login")
  end
end



get('/admin') do
  erb(:admin)
end

########## questions/quiz ##########


post('/questions') do
  Question.create({description: params['description']})
  redirect '/admin'
end

delete('/questions') do
  question  = Question.find(params["question_id"])
  question.destroy
  redirect '/admin'
end

get('/quiz') do
  if session[:user_id]
    erb(:quiz)
  else
    redirect("/sessions/new")
  end
end

########## sessions ##########

get('/sessions/new') do
  erb(:user_login)
end

post('/sessions') do
  email = params.fetch("email")
  user = User.where(email: email).first

  if user != nil
    id = user.id
    session[:user_id] = id
    redirect("/users/#{id}")
  else
    redirect('/sessions/new')
  end
end

get ('/users/:id/preferences') do
  user_id = params["id"]
  @user = User.find(user_id)
  erb(:preferences)
end

post('/quiz') do
  user_id = session[:user_id]
  @user = User.find(user_id)
  Question.all.each do |question|
    value = params["#{question.id}"]
    question_id = question.id
    if Response.where({:user_id => user_id, :question_id => question_id}).first
      update_response = Response.find_by({:user_id => user_id, :question_id => question_id})
      update_response.update_attributes({:value => value})
    else
      Response.create({:user_id => user_id, :question_id => question_id, :value => value})
    end
  end
  redirect("/users/#{user_id}/preferences")
end

get('/sessions/logout') do
  session[:user_id] = nil
  session[:admin] = nil
  redirect('/')
end

########## users ##########

get('/users/new') do
  @cohorts = Cohort.all
  erb(:add_user)
end

get('/users') do
  @users = User.all
  erb(:users)
end

post('/users') do
  name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  email = params.fetch("email")
  password = params.fetch("password")
  cohort_id = params["cohort_id"].to_i
  user = User.new({:name => name, :last_name => last_name, :email => email, :password => password, :cohort_id => cohort_id})
  if user.save()
    id = user.id
    session[:user_id] = id
    redirect("/users/#{id}")
  else
    redirect("/users/new")
  end
end

get('/users/:id') do
  id = params.fetch('id').to_i
  @user = User.find(id)
  if id == session[:user_id]
    erb :my_detail
  else
    erb :user_detail
  end
end

get('/users/:id/edit') do
  id = params.fetch('id').to_i
  @user = User.find(id)
  @cohorts = Cohort.all
  erb(:user_edit)
end

patch('/users/:id') do
  id = params.fetch('id').to_i
  @user = User.find(id)
  name = params.fetch("first_name", @user.name)
  last_name = params.fetch("last_name", @user.last_name)
  email = params.fetch("email", @user.email)
  password = params.fetch("password", @user.password)
  cohort_id = params.fetch("cohort_id", @user.cohort_id).to_i
  @user.update_attributes({:name => name, :last_name => last_name, :email => email, :password => password, :cohort_id => cohort_id})
  redirect("/users/#{id}")
end

delete('/users/:id') do
  id = params.fetch('id').to_i
  user = User.find(id)
  user.destroy
  redirect('/')
end

########## cohorts ##########

get('/cohorts/:id') do
  id = params.fetch("id").to_i
  @cohort = Cohort.find(id)
  @users = User.where(cohort_id: id)
  erb(:cohort_detail)
end

########## calendar ##########

get('/users/:id/calendar') do
  @today = Time.new()
  @user = User.find(params[:id].to_i)
  erb(:calendar)
end

########## pairs ##########

post('/pairs') do
  day = params.fetch('day')
  partner_id = params.fetch('partner_id').to_i
  Pair.create({user_id: session[:user_id], partner_id: partner_id, day: day})
  Pair.create({user_id: partner_id, partner_id: session[:user_id], day: day})

  redirect("/users/#{session[:user_id]}")
end

delete('/pairs') do
  pair_id = params.fetch('pair_id').to_i
  pair = Pair.find(pair_id)
  pair.destroy_inverse
  pair.destroy
  redirect("/users/#{session[:user_id]}")
end
