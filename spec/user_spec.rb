require 'spec_helper'

describe User do

  before do
    @test_user = User.create(name: 'Dave')
  end

  it 'validates with name' do
    test_user1 = User.new(name: "")
    expect(test_user1.save).to eq false
  end

  it 'titlecases the name before save' do
    test_user1 = User.create(name: "dave")
    expect(test_user1.name).to eq "Dave"
  end

end
