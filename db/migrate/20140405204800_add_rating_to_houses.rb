class AddRatingToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :rating, :integer
  end
end
