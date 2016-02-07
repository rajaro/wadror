class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy

  validates :name, length: { minimum: 1 }
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    less_than_or_equal_to: 2016,
                                    only_integer: true }

   
end
