class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_user
	before_action :set_all_categories
	helper_method :current_purchase


	def current_purchase
    	if current_user != nil
    		purchase = Purchase.find_by(:user_id => current_user.id, :status => "Создана")
    		puts purchase
    		purchase = Purchase.new if purchase.nil?
    	end
    	purchase
  	end

	def set_all_categories
		@all_categories = Category.all
		puts @all_categories
 	end

	def set_user
		@user = current_user
	end
	protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation , :fio, :address, :telephone) }
        end
end
