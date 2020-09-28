# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  before_action :set_user

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
def edit
end

def update
  if !params[:password].blank? && params[:password] == params[:password_confirmation]
    if @user.update(user_params)
# Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to user_session_path
    end
  else
     if params[:password].blank?
        @user.update(user_params.except(:password, :password_confirmation))
        redirect_to user_session_path
      else
        render "edit"
      end
  end
end  

private

def set_user
  @user = current_user
end

def user_params
# NOTE: Using `strong_parameters` gem
  params.require(:user).permit(:email, :fio, :phone, :address, :password, :password_confirmation)
  end

end
