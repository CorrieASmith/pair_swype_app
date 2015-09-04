class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => 'User'

  validates :day, presence: true
  
end
