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
