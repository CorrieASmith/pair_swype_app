require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'pry'

get('/') do
  erb(:index)
end

get('/admin_login') do
  erb(:admin_login)
end

get('/admin') do
  @questions = Question.all()
  erb(:admin)
end

post('/questions') do
  @questions = Question.all()
  @question = Question.create({description: params['description']})
  redirect '/admin'
end
