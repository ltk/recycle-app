class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:reclaim]
  before_filter :authenticate_admin!, only: [:dashboard]

  # You could refactor this list of actions to something like this:
  helper_method :brands, :products

  PAGES = %w(home
             about
             faq
             marketing
             materials
             contact
             labels
             consumers
             manufacturers
             international
             reclaim)

  PAGES.each do |page|
    define_method(page){}
  end

  private

  def brands
    @brands ||= Brand.all
  end

  def products
    @products ||= Product.all
  end
end
