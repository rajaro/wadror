require 'rails_helper'
 def create_beer_with_rating(score)
      @user = FactoryGirl.create(:user)
      @beer = FactoryGirl.create(:beer)
      FactoryGirl.create(:rating, score:score, beer:@beer, user:@user)
    end

describe 'Ratings are displayed' do
 it 'and deleted on users page' do
   visit signin_path
      create_beer_with_rating(15)
      fill_in('username', with:'Pekka')
      fill_in('password', with:'Foobar1')
      click_button('Log in')
   visit user_path(@user)
   click_link('delete')
   expect(Rating.count).to eq(0)

end
end
