class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :submissions
end