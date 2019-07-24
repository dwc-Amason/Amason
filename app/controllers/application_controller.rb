class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
      case resource
      when Admin
        admins_link_path
      end
    end

    def after_sign_out_path_for(resource)
    admin_session_path
    end # ログアウト後に遷移するpathを設定

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :email, :address, :phone, :is_quit])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end
