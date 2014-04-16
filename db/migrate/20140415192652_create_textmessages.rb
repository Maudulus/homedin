class CreateTextmessages < ActiveRecord::Migration
  def change
    create_table :textmessages do |t|
      t.datetime :date_time, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
