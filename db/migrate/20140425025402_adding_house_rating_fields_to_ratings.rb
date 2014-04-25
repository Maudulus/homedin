class AddingHouseRatingFieldsToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :cost, :integer, null: false
    add_column :ratings, :location, :integer, null: false
    add_column :ratings, :education, :integer, null: false
    add_column :ratings, :parking, :integer, null: false
    add_column :ratings, :condition, :integer, null: false
    add_column :ratings, :spaciousness, :integer, null: false
    add_column :ratings, :bedrooms, :integer, null: false
    add_column :ratings, :bathrooms, :integer, null: false
    add_column :ratings, :commute, :integer, null: false
    add_column :ratings, :culture, :integer, null: false
  end
end
