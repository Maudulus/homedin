class AddImageToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :image, :string
  end
end
