class SendMailMailer < ApplicationMailer

  def apply_notification(object)
    @object = object
    @object_count = object.class.count

    mail to: 'abhi@gmail.com', subject: "Application #{@object.class} successfully submitted "
  end

  def confirm_notification(object)
    @object = object
    @object_count = object.class.count

    mail to: 'abhi@gmail.com', subject: "Application #{@object.class} successfully Accepted "
  end

  def reject_notification(object)
    @object = object
    @object_count = object.class.count

    mail to: 'abhi@gmail.com', subject: "Application #{@object.class} successfully Rejected "
  end
end
