class AccountActivationsController < ApplicationController

    def edit
        user = User.find_by(email: params[:email])
        #一度有効化したら再度有効化しないようにする
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
            user.update_attribute(:acitivated, true)
            user.update_attribute(:activated_at, Time.zone.now)
            log_in user
            flash[:success] = "Account activated!"
            redirect_to user
        else
            flash[:danger] = "Invalid activation link"
            redirect_to root_url
        end
    end
end
