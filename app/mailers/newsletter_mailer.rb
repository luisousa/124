class NewsletterMailer < ActionMailer::Base
  default from: "dbo.infor@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  def weekly(email)
  @greeting = "Hi"

  mail to: email, subject: "RailsCasts Weekly"
  end
end
