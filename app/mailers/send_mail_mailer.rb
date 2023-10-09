class SendMailMailer < ApplicationMailer

  def apply_notification(object)
    @object = object
    mail to: @object.email, subject: "Your Application #{@object.class} successfully submitted "
  end

  def confirm_notification(object)
    @object = object
    mail to: @object.email, subject: "Your Application #{@object.class} Accepted "
  end

  def reject_notification(object)
    @object = object
    mail to: @object.email, subject: "Your Application #{@object.class} Rejected "
  end
end
