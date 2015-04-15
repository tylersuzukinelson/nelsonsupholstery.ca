class ContactMailer < ApplicationMailer
  def send_message(name, email, message)
    @name = name
    @email = email
    @message = message
    mail to: 'robnelson2223@gmail.com', subject: 'New Message from nelsonsupholstery.ca'
  end
end
