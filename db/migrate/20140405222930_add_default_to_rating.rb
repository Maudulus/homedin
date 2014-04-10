class AddDefaultToRating < ActiveRecord::Migration
  def change
    change_column :ratings, :value, :integer, default: 0
  end
end
