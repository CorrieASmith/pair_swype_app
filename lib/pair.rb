class Pair < ActiveRecord::Base
  belongs_to :user
  belongs_to :partner, :class_name => 'User'

  validates :day, presence: true
  validates :user_id, uniqueness: { scope: :day }
  validates :partner_id, uniqueness: { scope: :day }

  def destroy_inverse
    inverse = Pair.where(user_id: self.partner_id, partner_id: self.user_id, day: day).first
    inverse.destroy
  end

  def self.create_inverse(user_id, partner_id, day)
    Pair.create({user_id: user_id, partner_id: partner_id, day: day})
    Pair.create({user_id: partner_id, partner_id: user_id, day: day})
  end
end
