class AddHouseIdColumnToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :house_id, :integer
  end
end
