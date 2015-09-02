ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    User.all.each do |user|
      user.destroy
    end
<<<<<<< HEAD
    Question.all.each do |preference|
      preference.destroy
=======
    Question.all.each do |question|
      question.destroy
>>>>>>> origin/master
    end
  end
end
