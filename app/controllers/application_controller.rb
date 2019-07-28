class ApplicationController < ActionController::Base
before_action :ransack
	def after_sign_in_path_for(resource)
      case resource
      when Admin
        admins_link_path
      end
    end

    def ransack
      if admin_signed_in?
      @q = Item.ransack(params[:q])

      @t = User.ransack(params[:t], search_key: :t)
    elsif user_signed_in?

      @q = Item.ransack(params[:q])
    else
      @q = Item.ransack(params[:q])
    end
  end

    def after_sign_out_path_for(resource)
      admin_session_path
    end # ログアウト後に遷移するpathを設定

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :email, :address, :phone])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end

  private

  def check_admin
    if admin_signed_in?
    else
      redirect_to root_path
      flash[:notice] = "ログインしてください"
    end
  end

end
