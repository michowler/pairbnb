class SessionsController < Clearance::SessionsController
	def create
	   @user = authenticate(params)

	   sign_in(@user) do |status|
	     if status.success?
	     	flash[:success] = "success"
	       redirect_back_or url_after_create
	     else
	       flash[:danger] = status.failure_message
	       render template: "sessions/new", status: :unauthorized
	     end
	   end
	 end

	 def destroy
	    sign_out
	    redirect_to url_after_destroy, success:'Logged out!'
	 end
end
