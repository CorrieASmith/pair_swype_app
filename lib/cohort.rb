class Cohort < ActiveRecord::Base
  has_many :users

  def season
    if self.trimester == 1
      return "Spring"
    elsif self.trimester == 2
      return "Summer"
    elsif self.trimester == 3
      return "Winter"
    end
  end
end
