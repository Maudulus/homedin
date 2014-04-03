class AddHouseIdColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :house_id, :integer
  end
end
