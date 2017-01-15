class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :requisitions
	has_many :personal_references, through: :requisitions
end
