class Rating < ActiveRecord::Base
 belongs_to :beer
 def to_s

  bid = self.beer_id
  b = Beer.where id:bid
  bname = b.name
  
  "#{beer.name} #{bid}"
 end
   def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to ratings_path
  end
end
