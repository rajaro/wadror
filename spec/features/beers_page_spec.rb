require 'rails_helper'

describe "Beer can be created if " do
  it "has a proper name" do
    b = FactoryGirl.create(:brewery)
    u = FactoryGirl.create(:user)
    visit signin_path
    save_and_open_page
    fill_in('username', with:'Pekka')
    fill_in('password', with:'Foobar1')
    click_button('Log in')
    visit new_beer_path
      fill_in('Name', with:'aaa')

      
  expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)  
end
end        


