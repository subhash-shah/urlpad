class Tag < ActiveRecord::Base

	# Validations
	validates :name, presence: true, uniqueness: true
	
	# Associations
	has_and_belongs_to_many :links
	belongs_to :created_by, class_name: "User", foreign_key: "user_id"
end
