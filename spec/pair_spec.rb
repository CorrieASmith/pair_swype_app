require 'spec_helper'

describe(Pair) do
  describe('#partners') do

    it('') do
      test_user1 = User.create({name: 'Dave', last_name: 'Daveson', email: 'dave@dave.com', password: 'davedave'})
      test_user2 = User.create({name: 'Steve', last_name: 'Steveson', email: 'steve@steve.com', password: 'stevesteve'})
      Pair.create({user_id: test_user1.id, partner_id: test_user2.id, day: "09/01/15"})
      expect(test_user1.partners).to eq [test_user2]
    end

    it('') do
      test_user1 = User.create({name: 'Dave', last_name: 'Daveson', email: 'dave@dave.com', password: 'davedave'})
      test_user2 = User.create({name: 'Steve', last_name: 'Steveson', email: 'steve@steve.com', password: 'stevesteve'})
      test_user3 = User.create({name: 'Sean', last_name: 'Seanson', email: 'sean@sean.com', password: 'seansean'})
      Pair.create({user_id: test_user1.id, partner_id: test_user2.id, day: "09/01/15"})
      test_pair = Pair.new({user_id: test_user1.id, partner_id: test_user3.id, day: "09/01/15"})
      expect(test_pair.save).to eq false
    end
  end
end
