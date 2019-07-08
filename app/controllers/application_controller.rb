class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configue_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, :keys[:name_first,:name_last,:tel])
	end
end
