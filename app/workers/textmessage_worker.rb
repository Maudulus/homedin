class MessageWorker
  include Sidekiq::Worker

  def perform(contact, message)
    ContactGroup.find(contact).send_text_messages(message)
  end
end
