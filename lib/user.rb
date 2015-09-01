class User < ActiveRecord::Base
  belongs_to :cohort
  has_many :responses
  has_many :preferences, through: :responses
  before_save(:title_case)

  validates(:name, presence: true)

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
