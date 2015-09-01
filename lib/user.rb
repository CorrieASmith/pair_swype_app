class User < ActiveRecord::Base
  has_many :responses
  has_many :preferences, through: :responses
end
