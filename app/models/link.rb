class Link < ActiveRecord::Base

  # Validations
  validates :url, presence: true
end
