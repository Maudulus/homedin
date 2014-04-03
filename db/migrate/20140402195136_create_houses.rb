class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :price
      t.string :town
      t.text :description
      t.integer :bedrooms
      t.integer :bathrooms

      t.timestamps
    end
  end
end
