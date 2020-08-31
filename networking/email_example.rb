require 'net/pop'
require 'net/smtp'
require 'action_mailer'

# Working with net/pop library
#
mail_server = Net::POP3.new('mail.mailserversomewhere.com')

begin
  mail_server.start('username', 'password')
  if mail_server.mails.empty?
    puts 'No mail'
  else
    # downloading mails on the server
    mail_server.mails.each do |m|
      # mail = m.pop # download mail
      m.delete if m.pop =~ /\bthis is a spam e-mail\b/i # delete a mail
      m.delete if m.header =~ /Subject:.+?medicines\b/i # check header only
      puts mail
    end
    puts "#{mail_server.mails.length} mails waiting"
  end
rescue
  puts 'mail error'
end

# Working with net/smtp library
#
message = <<MESSAGE_END
  From: Private Person <me@private.net>
  To: Author of Beggining Ruby <test@rubyinside.com>
  Subject: SMTP e-mail test

  This is a test e-mail message
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@privacy.net', 'test@rubyinside.com'
end

# other details specifications
Net::SMTP.start('mail.your-domain.com', 'port 25', 'localhost', 'username',
                'password', ':plain or :login or :cram_md5')

# Working with ActionMailer library
#
ActionMailer::Base.smtp_settings = {
  address: 'mail.your-domain.com',
  port: 25,
  authentication: :login,
  user_name: 'username',
  password: 'password'
}

# Emailer class
class EMailer < ActionMailer::Base
  # Usage EMailer.test_email
  # (calling a method as class method instead of instance method)
  def test_email(email_address, email_body)
    mail(to: email_address,
         from: 'me@privacy.net',
         subject: 'test',
         body: email_body) # Mail object requires active_job to deliver
  end
end

EMailer.test_email('test@rubyinside.com', 'This is a test e-mail').deliver_now

