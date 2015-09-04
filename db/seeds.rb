class Cohort < ActiveRecord::Base

  Cohort.create({language: 'Ruby', trimester: 2, year: 2015})
  Cohort.create({language: 'PHP', trimester: 2, year: 2015})
  Cohort.create({language: 'Java', trimester: 2, year: 2015})

end

class User < ActiveRecord::Base
  User.create({name: 'Ryan', last_name: 'Broughan', cohort_id: 1, email: 'ryan.broughan@gmail.com', password: "tacotaco"})
  User.create({name: 'Julianna', last_name: 'Green', cohort_id: 1, email:'juliannaggreen@gmail.com', password: "tacotaco"})
  User.create({name: 'Alex', last_name: 'Altieri', cohort_id: 1, email: "alexandra.m.altieri@gmail.com", password: "tacotaco"})
  User.create({name: 'Corrie', last_name: 'Smith', cohort_id: 1, email: 'corriesmith87@gmail.com', password: "tacotaco"})
  User.create({name: 'Dr. Butt', last_name: 'Swype', cohort_id: 3, email: 'butts@swype.com', password: "tacotaco"})
  User.create({name: 'Dr. UpperLip', last_name: 'Sweat', cohort_id: 3, email: 'moist@drops.com', password: "tacotaco"})
end
