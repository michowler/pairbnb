class UsersController < Clearance::UsersController
	def create
	    @user = user_from_params

	    if @user.save
	      sign_in @user
	      redirect_back_or url_after_create
	    else
	      render template: "users/new"
	    end
	end

	def index
	    # do some things here

	    respond_to do |format|
	      format.js { flash.now[:notice] = "Here is my flash notice" }
	    end
	end

	private
	def user_params
		params.require(:user).permit(:full_name, :email, :password, :gender, :age)
	end
end
