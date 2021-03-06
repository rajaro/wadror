require 'rails_helper'

describe "beerlist page" do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    @user = FactoryGirl.create(:user)
    @brewery1 = FactoryGirl.create(:brewery, name: "Koff")
    @brewery2 = FactoryGirl.create(:brewery, name: "Schlenkerla")
    @brewery3 = FactoryGirl.create(:brewery, name: "Ayinger")
    @style1 = Style.create name: "Lager"
    @style2 = Style.create name: "Rauchbier"
    @style3 = Style.create name: "Weizen"
    @beer1 = FactoryGirl.create(:beer, name: "Nikolai", brewery: @brewery1, style: @style1)
    @beer2 = FactoryGirl.create(:beer, name: "Fastenbier", brewery: @brewery2, style: @style2)
    @beer3 = FactoryGirl.create(:beer, name: "Lechte Weisse", brewery: @brewery3, style: @style3)
  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it "shows a known beer", :js => true do
    visit beerlist_path
    find('table').find('tr:nth-child(2)')
    expect(page).to have_content "Nikolai"
  end

  it "the beers are in alphabetical order", :js => true do
    visit beerlist_path
    @a = find('table').find('tr:nth-child(2)')
    expect(@a).to have_content "Fastenbier"
    @b = find('table').find('tr:nth-child(3)')
    expect(@b).to have_content "Lechte Weisse"
end
  
  it "and clicking on style ", :js => true do
    visit beerlist_path
    click_link('style')
    @c = find('table').find('tr:nth-child(2)')
    expect(@c).to have_content "Lager"
    end   
   
  it "or brewery changes the order", :js => true do
    visit beerlist_path
    click_link('brewery')
    @d = find('table').find('tr:nth-child(2)')
    expect(@d).to have_content "Ayinger"
    @e = find('table').find('tr:nth-child(3)')
    expect(@e).to have_content "Koff"
end
 
end
