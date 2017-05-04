class UsersController < Clearance::UsersController

	def show
		@user = User.find(params[:id])
	end	

	def edit
		@user = User.find(params[:id])
	end	

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to @user
	end	

	def create
	    @user = user_from_params
	    
	    if @user.save
	      sign_in @user
	      redirect_back_or url_after_create
	    else
	      render template: "users/new"
	    end
	end

	private
	def user_params
		params.require(:user).permit(:full_name, :email, :password, :gender, :age, :avatar)
	end


end
