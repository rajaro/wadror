
require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "Beer is created if it has a name and a style" do
    b = Beer.create name:"testiolut", style:"Lager"
    expect(Beer.count).to eq(1)
    expect(b).to be_valid
 end

  it "and it will not be created without a name" do
    b = Beer.create style:"Lager"
    expect(b).to_not be_valid
end
  it "or a style" do
   b = Beer.create name:"testiolut2"
   expect(b).to_not be_valid
end
end


