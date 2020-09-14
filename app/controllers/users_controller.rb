require 'pry'
##all these places where user is defined cab be in a before action for dry.
class UsersController < ApplicationController
    # #before_action :current_user
    skip_before_action :verified_user, only: [:new, :create]
    # #before_action :require_logged_in, except: [:welcome, :new, :create ]
    # #skip_before_action :verified_user, only: [:new, :create]

    def new 
        @user = User.new
    end

    # def signin
    # end

    # def login 
    #     @user=User.find_by(name: params[:user][:name])
    #     if @user 
    #         session[:user_id] = @user.id 
    #         #binding.pry
    #         redirect_to user_path(@user)
    #     else
    #         redirect_to signin_path
    #     end
    # end

    # def logout 
    #     session.delete(:user_id)
    #     redirect_to root_path
    # end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            # redirect_to controller: 'users', action: 'new'
            render 'new'

        end
    end

    def show 
            @user = User.find(params[:id])
    end
   
    # def update
    #     @user = User.find(params[:id])
    #     @user.update(user_params)
    #     redirect_to user_path(@user)
    # end

    # def edit 
    #     @user = User.find_by(id: params[:id])
    # end
    private
   
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
  end
  