class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:reclaim]
  before_filter :authenticate_admin!, only: [:dashboard]

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

  def contact
  end

  def dashboard
  end

  def labels
  end

  def consumers
  end

  def manufacturers
  end

  def reclaim
    @brands = Brand.all
  end
end
