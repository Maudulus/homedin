class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email_address
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
