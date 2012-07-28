# Load the rails application
require File.expand_path('../application', __FILE__)

Depot::Application.configure do
  config.action_mailer.delivery_method = :sendmail
end

# Initialize the rails application
Depot::Application.initialize!
