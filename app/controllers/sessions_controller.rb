class SessionsController < ApplicationController

  def new
  end

  def create
    #nhan doi tuong truyen vao tu view co ten la session
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "login success"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "email or password not correct!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "logout success"
    redirect_to root_path

  end

end
