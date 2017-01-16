class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :requisitions
	has_many :personal_references, through: :requisitions

	# --- HELPER METHODS ---

	def all_names
	  return "#{self.first_name || ''}#{' ' unless !self.first_name || !self.second_name}#{self.second_name || ''}"
	end

end
