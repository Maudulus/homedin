class AddTimeZoneColumnToTextmessage < ActiveRecord::Migration
  def change
    add_column :textmessages, :time_zone, :string
  end
end
