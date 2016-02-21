require 'rails_helper'
 def create_beer_with_rating(score)
      @user = FactoryGirl.create(:user)
      @beer = FactoryGirl.create(:beer)
      FactoryGirl.create(:rating, score:score, beer:@beer, user:@user)
    end

def create_beer2_with_rating(score)
    @user2 = FactoryGirl.create(:user2)
    @beer = FactoryGirl.create(:beer)
    FactoryGirl.create(:rating, score:score, beer:@beer, user:@user2)
end

describe 'Ratings are displayed correctly' do
  it 'after created' do
  @ratings = Rating.all
  create_beer_with_rating(20)
  visit ratings_path
  expect(page).to have_content 'Number of ratings: 1'
  end

 describe 'and displayed correctly' do
 it 'on the users page' do
 create_beer_with_rating(20)
 create_beer2_with_rating(11)
 visit user_path(@user)

 expect(page).to have_content ('20')
 expect(page).to_not have_content ('11')
end
end
 
   
end
  







     
