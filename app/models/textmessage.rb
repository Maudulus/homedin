class Textmessage < ActiveRecord::Base
  belongs_to :house
  belongs_to :user

  validates :date_time, presence: true
  validates :phone_number, presence: true, format: { with: /\A\+?\d{11}\z/ }
end
