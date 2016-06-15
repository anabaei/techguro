class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by email: params[:email].downcase
   if user && user.authenticate(params[:password])
   	#sign in
   session[:user_id] = user.id
   flash[:notice] = "you are successfully sign in "
   flash[:info] = "a notice has been sent to your email for records " 
   redirect_to root_url

    # Pony.mail(to:   user.email,
    #           from: "amircmpt@gmail.com",
    #            subject:  "Thanks for the signin dear " ,
    #           via: :smtp,
    #           via_options: {
    #           address: "smtp.gmail.com",
    #           port: "587",
    #           enable_starttls_auto: true,
    #           user_name: "answerawesome",
    #          password: "Sup3r$ecret",
    #           authentication: :plain,
    #           domain: "gmail.com"
    #      	   }
    #          )
    
    #    Pony.mail(to:  "anabaei@sfu.ca",
    #           from: "amircmpt@gmail.com",
    #            subject:  "Thanks for the signin dear ",
    #           via: :smtp,
    #           via_options: {
    #           address: "smtp.gmail.com",
    #           port: "587",
    #           enable_starttls_auto: true,
    #           user_name: "answerawesome",
    #          password: "Sup3r$ecret",
    #           authentication: :plain,
    #           domain: "gmail.com"
    #                }
    #          )
   else
        flash[:error] = "Invalid email/password"
        redirect_to root_url
  end


end

 def destroy
  session[:user_id] = nil
  flash[:notice] = "you are signd out"
  redirect_to root_url
 end

end
