class Brand < ActiveRecord::Base
  has_many :products
  has_many :submissions

  has_attached_file :image, :styles => { :medium => "210x125>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image
end