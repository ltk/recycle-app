class PagesController < ApplicationController
  def home
  end

  def about
  end

  def reclaim
    @brands = Brand.all
  end
end
