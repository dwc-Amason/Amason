class UsersController < ApplicationController
	def edit
		@user = User.find(params[:id])
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
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
  		@shipping_address = ShippingAddress.where(user_id: @user.id)
  	end

  	def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to  root_path
    flash[:notice] = "削除されました"
  end



	private

	def user_params
	   	params.require(:user).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :post_code, :address, :phone, :admin, :quit_flag)
	end
end
