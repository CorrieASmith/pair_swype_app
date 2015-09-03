class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => 'User'

  validates :day, presence: true
  validates :user_id, uniqueness: { scope: :day }
  validates :partner_id, uniqueness: { scope: :day }

end
