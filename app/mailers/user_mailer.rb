class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user    
    #送り先と件名の設定
    mail to: user.email, subject: "Account activation"
  end
  
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
