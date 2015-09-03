class Admin < ActiveRecord::Base
  validates_acceptance_of(:password, message: 'CorrieJuliannaAlexRyan')
end
