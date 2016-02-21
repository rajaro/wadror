

require 'rails_helper'

RSpec.describe User, type: :model do
  it "User will not be saved with a too short password" do

    user = User.create username:"Pekka", password:"aaa"
    expect(User.count).to eq(0)
    expect(user).not_to be_valid

  end
end

