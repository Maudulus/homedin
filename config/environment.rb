# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
HomedIn::Application.initialize!

config.action_mailer.default_url_options = { :host => 'homedin.herokuapp.com' }
