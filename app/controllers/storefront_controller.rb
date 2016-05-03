class StorefrontController < ApplicationController
  def all_items
  	@products = Product.all
  end

  def items_by_category
  	@category = Category.find(params[:id])
  	@products = Product.all
  	@products_by_cat = []

  	@products.each do |product|
  		if product.category.id == params[:id].to_i
  			@products_by_cat << product
  		end
  	end

  end

  def items_by_brand
  	@brand_name = params[:brand]
  	@products = Product.all
  	@products_by_brand = []

  	@products.each do |product|
  		if product.brand == params[:brand]
  			@products_by_brand << (product)
  		end
  	end
  end
end











