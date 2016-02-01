class Link < ActiveRecord::Base

  # Validations
  validates :title, :url, presence: true

  # Associations
  belongs_to :user
  has_and_belongs_to_many :tags

  # Nested Attributes
  accepts_nested_attributes_for :tags

  # Scopes
  scope :by_tag, -> (tag_name) {
  	joins(:tags).where("tags.name = ?", tag_name)
  }
end
