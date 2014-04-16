class Textmessage < ActiveRecord::Base
  belongs_to :house
  belongs_to :user

  validates :date_time, presence: true
  validates :phone_number, presence: true, format: { with: /\A\+?\d{11}\z/ }

  def send_text_messages(message)
    # TODO this needs to be async
    client = self.user.twilio_client

    self.contacts.find_each do |c|
      client.account.sms.messages.create(
          body: message,
          to:   c.phone,
          from: self.user.twilio_phone_number)
      ContactLog.create!(user_id: self.user_id,
                         contact_group_id: self.id,
                         contact_id: c.id)
    end
  end

end
