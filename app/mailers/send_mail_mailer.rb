class SendMailMailer < ApplicationMailer

  def apply_notification(object)
    @object = object
    @object_count = object.class.count

    mail to: 'abhi@gmail.com', subject: "Application #{@object.class} successfully Submited "
  end
end
