require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end
 
  it "if several are returned, they are all shown" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ), Place.new( name:"KB", id: 2 ) ]
    )

     visit places_path
     fill_in('city', with:'kumpula')
     click_button "Search"
     expect(page).to have_content "Oljenkorsi"
     expect(page).to have_content "KB"
end

 it "if no places are returned" do
    
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      []
    )
     visit places_path
     
     fill_in('city', with:'kumpula')
     click_button "Search"
      save_and_open_page
     expect(page).to have_content "No locations in kumpula"
end
   
end
