# Preview all emails at http://localhost:3000/rails/mailers/send_mail_mailer
class SendMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_mail_mailer/apply_notification
  def apply_notification
    SendMailMailer.apply_notification
  end

end
