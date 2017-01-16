class User < ActiveRecord::Base
	has_one :profile
	has_secure_password

  # --- HELPER METHODS ---

  def has_profile?
    return self.profile ? true : false
  end

  def has_complete_profile_message
  	# TO-DO
  	return "Tu cuenta todavía no está completa"
  end
end
