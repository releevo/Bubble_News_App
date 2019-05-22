class MyMailer < ActionMailer::Base
end

class UserMailer < ActionMailer::Base
    default from: 'roisin.briscoe@gmail.com'

    def notification_email(user)
        @user = user
        @url = 'http://bubbles.com/login'
        mail(to: @user.email, subject: 'You have a new notification')
    end
  end