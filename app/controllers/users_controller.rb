class UsersController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
  	@user = User.find(params[:id])
	  	if @user.update(user_params)
			redirect_to items_path(@user.id)
		else
			render :edit
		end
  	end

  	def show
  		@user = User.find(params[:id])
  	end

  	def destroy
  		@user = User.find_by(id: params[:id])
  		if @user.destroy
  			redirect_to users_path
  		else
  			render :edit
  		end
  	end

  	def search
  	end

	private

	def user_params
	   	params.require(:user).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :admin, :quit_flag)
	end
end
