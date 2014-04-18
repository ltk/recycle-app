class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:reclaim]
  def home
  end

  def about
    @brands = Brand.all
    @products = Product.all
  end

  def faq
  end

  def marketing
  end

  def materials
  end

  def reclaim
    @brands = Brand.all
  end
end
