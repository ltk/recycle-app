class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  belongs_to :product

  # You should look into https://github.com/pluginaweek/state_machine
  # Also Rails 4.1 includes a new enum thing for what you're doing here
  # http://edgeguides.rubyonrails.org/4_1_release_notes.html#active-record-enums
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
