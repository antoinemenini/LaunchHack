class UserMailer < ActionMailer::Base
  
  def send_message(current_user, user, message)
    @message = message

    mail( from: current_user.email, to: boostr.email, subject: "Boostr: #{current_user} needs your help!" )
  end
end
