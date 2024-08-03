class SessionsController < ApplicationController
  def new
 end

 def create
   puts "Params: #{params.inspect}"  # Debug

  user = User.find_by(email: params[:email].downcase)
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Successfully logged in!'
  else
    flash.now[:alert] = 'Invalid email or password'
    render :new
  end
 end

 def destroy
   session[:user_id] = nil
   redirect_to root_path, notice: "Successfully logged out!"
 end
end
