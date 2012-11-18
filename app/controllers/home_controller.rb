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
end
