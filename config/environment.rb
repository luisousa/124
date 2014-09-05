# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Scrap::Application.initialize!

Scrap::Application.configure do
  config.action_mailer.default_url_options = { host: "localhost" }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "dbo.infor@gmail.com",
    password: "pjumooh;..10"
  }



end