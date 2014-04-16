class AddUserAndHouseIdsToTextmessageTable < ActiveRecord::Migration
  def change
    add_column :textmessages, :user_id, :integer
    add_column :textmessages, :house_id, :integer
  end
end
