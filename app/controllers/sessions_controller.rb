class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by email: params[:email]
   if user && user.authenticate(params[:password])
   	#sign in
   session[:user_id] = user.id
   flash[:notice] = "you are signed in and A confirmation email has been sent"
   redirect_to root_url

   else
    flash.now[:alert] = "Invalid email/password"
   	render 'new'
  end
end

 def destroy
  session[:user_id] = nil
  flash[:notice] = "you are signd out"
  redirect_to root_url
 end

end
