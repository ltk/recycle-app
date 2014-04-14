class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def submit
    product = Product.find(params[:id])
    submission = product.submissions.create(brand_id: product.brand_id, user_id: current_user.id)
    redirect_to submission_path(submission)
  end

end