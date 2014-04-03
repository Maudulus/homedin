class AddUrlColumnToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :url, :string
  end
end
