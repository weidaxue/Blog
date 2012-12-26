#encoding:utf-8

class SessionsController < ApplicationController

  def new
  	@user = User.new
  	session[:index] = 5
  end

  def create
  	@user = User.find_by_email(params[:user][:email])
  	if @user 
  		if @user.authenticate(params[:user][:password])
  			session[:user_id] = @user.id
  			redirect_to posts_path
  		else
  			flash[:password_error] = "密码输入错误"
  			redirect_to sign_in_path
  		end
  	else
       flash[:mail_error] = "输入用户不存在"
       redirect_to sign_in_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
