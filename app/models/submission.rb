class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  belongs_to :product
end
