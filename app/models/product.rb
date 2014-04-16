class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :submissions

  has_attached_file :image, :styles => { :large => "350x350>", :medium => "200x200>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image
end
