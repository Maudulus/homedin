class MessageWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  sidekiq_retries_exhausted do |msg|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}."
  end

  def perform(id)
    record = Textmessage.find id
    @twilio = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    @twilio.account.messages.create(
      from: ENV['ACCOUNT_PHONE_NUMBER'],
      to: record.phone_number,
      body: 'This is your scheduled reminder to view a house.'
    )
  end
end
