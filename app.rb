require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

get('/admin_login') do
  erb(:admin_login)
end

get('/admin') do
  erb(:admin)
end

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
  erb(:quiz)
end
