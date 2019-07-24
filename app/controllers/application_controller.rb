class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :email, :address, :phone, :is_quit])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end

end
