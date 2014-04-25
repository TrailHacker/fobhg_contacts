class ContactMailer < ActionMailer::Base
  default from: "no-reply@FriendsOfBlackhandGorge.org"

  def welcome_email(contact)
    @contact = contact
    @url = "http://fobhg.org"
    mail(to: @contact.email_address, subject: "Welcome Friend")
  end
end
