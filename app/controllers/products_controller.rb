class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :edit, :destroy]
  # before_action is the new before_filter. Who knows when before_filter
  # will be depreciated, so best to use the new syntax for everything.

  require 'easypost'
  # If this is in your Gemfile, you shouldn't have to require it here

  helper_method :brand, :product, :products
  # As mentioned in the products#index view file, I like to use helper methods
  # instead of accessing instance variables directly

  def index
    @products = if brand.present?
      brand.products
    else
      Product.all
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: product }
      else
        format.html { render action: 'new' }
        format.json { render json: product.errors, status: :unprocessable_entity }
      end
    end
  end

  # Anytime you find yourself adding new, non-RESTful actions, it's usually
  # as sign that your domain model is missing an element, which in turn usually
  # means that the action feels pretty messy.
  #
  # What is the difference between this and submissions#create ?
  def submit
    if current_user.country == "United States"
      # Don't need this set if you add `submit` to the :set_product before_action
      # whitelist
      product = Product.find(params[:id])

      EasyPost.api_key = ENV['EASYPOST_API_KEY']

      to_address = EasyPost::Address.create(
        # You switch between hash syntaxes in this file. Apparently this
        # makes some people (my coworkers) very angry.
        # also hash alignment ftw
        :name    => 'PLUSfoam Recycling',
        :street1 => '844 Production Place',
        :street2 => '',
        :city    => 'Newport Beach',
        :state   => 'CA',
        :zip     => '92663',
        :country => 'USA',
        :phone   => '949-646-6111'
      )
      from_address = EasyPost::Address.create(
        :company => current_user.first_name + " " + current_user.last_name,
        :street1 => '933 Main Street',
        :city    => current_user.city,
        :state   => current_user.state,
        :zip     => current_user.zipcode,
        :email   => current_user.email,
        :country => 'USA',
        :phone   => '949-646-6111'
      )

      parcel = EasyPost::Parcel.create(
        :width  => 11.6,
        :length => 15.2,
        :height => 3,
        :weight => 10
      )

      shipment = EasyPost::Shipment.create(
        :to_address   => to_address,
        :from_address => from_address,
        :parcel       => parcel,
        :options      => {:address_validation_level => 0}
      )

      shipment.buy(
        :rate => shipment.lowest_rate(carriers = ['USPS'], services = ['First'])
      )

      submission = product.submissions.create(brand_id: product.brand_id, user_id: current_user.id, label: shipment.postage_label.label_url, tracking: shipment.tracking_code)
      redirect_to submission_path(submission)

      Analytics.track(
        user_id:    current_user.id,
        event:      'Recycled item',
        properties: { brand: product.brand_id, product: product.name })

    else
      redirect_to international_path
    end
  end

  def update
    respond_to do |format|
      if product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        # Do you use json responses?
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

  attr_reader :product, :products

  def brand
    @brand ||= Brand.find(params[:brand_id]) if params[:brand_id]
  end
  # As mentioned in the products#index view file, I like to use helper methods
  # instead of accessing instance variables directly

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :brand_id, :collection_year, :image)
    end

end
