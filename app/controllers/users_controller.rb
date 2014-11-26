class UsersController < ApplicationController
 
  layout "test", only:[:index] 
  def index
    @user = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_param)


   if @user.save
    flash[:notice] = "You are new User, Confirmation letter has been sent"
   # Pony.mail(to:  params[:email],
    #        from: "amircmpt@gmail.com",
     #       subject:  "Thanks for the signup dear #{params[:email]} at TechGuru Project",
    #        via: :smtp,
     #         via_options: {
      #        address: "smtp.gmail.com",
       #       port: "587",
        #      enable_starttls_auto: true,
       #       user_name: "answerawesome",
        #      password: "Sup3r$ecret",
         #     authentication: :plain,
          #    domain: "gmail.com"
         #   }
          #  )

   redirect_to root_url   
   else
  	render 'new'
   end

  end

private 
	def user_param
	params.require(:user).permit( :name, :last, :email, :phone, :code, :password, :password_confirmation)
	end 

end
