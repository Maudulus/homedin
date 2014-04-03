class AddHouseIdColumnToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :house_id, :integer
  end
end
