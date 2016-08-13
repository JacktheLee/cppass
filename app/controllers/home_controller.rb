class HomeController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping 
  
  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def index
    @order = Order.new
  end

  def mypage
  end
end
