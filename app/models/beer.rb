class Beer < ActiveRecord::Base
 belongs_to :brewery
  has_many :ratings, dependent: :destroy


  
 def average_rating
  b = Rating.where(:beer_id => self.id).count
  "#{b}"
 
end
  
 def to_s
  bname = self.name
  brew = self.brewery.name
  "Beer: #{bname}, Brewery: #{brew}"
 end

end