class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :brands
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def brands
  	products = Product.all
  	@brands = []

  	products.each do |product|
  		unless @brands.include?(product.brand)
  			@brands << product.brand
  		end	
  	end

  	return @brands
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end
end
