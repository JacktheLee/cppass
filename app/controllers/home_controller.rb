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
  end

  def show
    @order = Order.new
  end

  def mypage
    @orders = Order.where(user_id: current_user)
  end
end
