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

class Question < ActiveRecord::Base
  Question.create({description: 'I have had experience programming before Epicodus.'})
  Question.create({description: 'I feel most successful when I am doing the  primary explaining of new concepts.'})
  Question.create({description: "I feel most successful when I set fire to the rain."})
  Question.create({description: 'I feel most successful when my partner is doing the primary explaining of new concepts.'})
  Question.create({description: 'I feel most successful when I may not finish the project but I have a thorough understanding of basic concepts.'})
  Question.create({description: 'I feel most successful when I finish one project completely.'})
  Question.create({description: "I feel most successful when I get as many projects done and challenge myself even if I don't fully understand everything by the end of the day."})
  Question.create({description: "I need to communicate my feelings throughout the day."})

end

class Admin < ActiveRecord::Base
  Admin.create({password: 'CorrieJuliannaAlexRyan'})
end
