class Pair < ActiveRecord::Base
  belongs_to :user
  belongs_to :partner, :class_name => 'User'

  validates :user_id, uniqueness: { scope: :day }
  validates :partner_id, uniqueness: { scope: :day }
end
