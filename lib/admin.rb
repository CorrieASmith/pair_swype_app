class Admin < ActiveRecord::Base
  validates(:password, presence: true)
end
