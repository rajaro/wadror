class ChangeBeerStyle < ActiveRecord::Migration
  def change
    change_table :beers do |b|
       b.integer :style_id
       b.rename :style, :old_style
       
       end
  end
end
