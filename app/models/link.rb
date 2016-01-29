class Link < ActiveRecord::Base

  # Validations
  validates :url, presence: true
  belongs_to :user
end
