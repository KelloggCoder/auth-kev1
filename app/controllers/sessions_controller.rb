class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

 
 def create
  @user = User.find_by({ "email" => params["email"] })
  if @user
    if BCrypt::Password.new(@user["password"]) == params["password"]
      #adding cookies
      session["user_id"] = @user["id"]
      # login the user
      flash["notice"] = "You've logged in."
      redirect_to "/companies"
    else
      flash["notice"] = "Login Failed."
      redirect_to "/sessions/new"
    end
  else
     flash["notice"] = "Login Failed."
    redirect_to "/sessions/new"
  end
end
      


  def destroy
  flash["notice"] = "Goodbye."
  session["user_id"] = nil
  redirect_to "/sessions/new"
  end
end
