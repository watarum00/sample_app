class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user    
    #送り先と件名の設定
    mail to: user.email, subject: "Account activation"
  end
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
