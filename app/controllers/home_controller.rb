class HomeController < ApplicationController
  
  def index
  	session[:index] = 1
  end
  
  def about
  	session[:index] = 4
  end

  def friends
  	session[:index] = 3
  end

  def login_out
  	session[:admin] = nil
  	session[:index] = 1
  	redirect_to root_path
  end

end
