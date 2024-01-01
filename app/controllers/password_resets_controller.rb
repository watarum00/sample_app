class PasswordResetsController < ApplicationController
  def new
  end

  def create
    #まずemailからユーザーを検索
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest#パスワード再設定の属性を設定するメソッド
      @user.send_password_reset_email#パスワード再設定のメールを送信するメソッド
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end
end
