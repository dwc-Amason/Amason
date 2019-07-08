class UsersController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
  	@user = User.find(params[:id])
	  	if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :edit
		end
  	end

  	def show
  		@user = User.find(params[:id])
  	end

  	def link
  	end


	private

	def user_params
	   	params.require(:user).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :admin, :quit_flag)
	end
end
