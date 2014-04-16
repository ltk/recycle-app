class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  belongs_to :product

  STATUS_PENDING = 1
  STATUS_RECEIVED = 2
  STATUS_PROCESSED = 3

  def status_string
    case status
      when 1
        "Pending"
      when 2
        "Received"
      when 3
        "Processed" 
    end
  end
end
