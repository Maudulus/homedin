class AddAddressColumnToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :address, :string
  end
end
