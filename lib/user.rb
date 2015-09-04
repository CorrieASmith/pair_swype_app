class User < ActiveRecord::Base
  belongs_to :cohort
  has_many :responses
  has_many :questions, through: :responses
  before_validation(:title_case)

  has_many :requests
  has_many :pairs
  has_many :partners, :through => :pairs

  validates(:name, presence: true)
  validates(:last_name, presence: true)
  validates(:email, presence: true)
  validates(:password, { presence: true, length: { minimum: 8, maximum: 20 }})

  def full_name
    "#{self.name} #{self.last_name}"
  end


private

  def title_case
    name = self.name.downcase
    words = name.split(' ')
    words.map do |word|
      word.capitalize!()
    end
    self.name = words.join(" ")
  end

end
