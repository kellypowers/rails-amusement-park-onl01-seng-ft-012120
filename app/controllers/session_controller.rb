class SessionController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  def new
     @user = User.new
     #binding.pry
  end

  def create

    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
    
      #@user = @user.try(:authenticate, params[:user][:password])
      #binding.pry

  def destroy
    session.delete("user_id")
    redirect_to '/'
  end
end