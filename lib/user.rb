class User < ActiveRecord::Base
  belongs_to :cohort
  has_many :responses
  has_many :questions, through: :responses
  before_save(:title_case)


  validates(:name, presence: true)
  validates(:last_name, presence: true)
  validates(:email, presence: true)
  validates(:password, { presence: true, length: { minimum: 8, maximum: 20 }})

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
