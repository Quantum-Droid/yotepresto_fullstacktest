class User < ActiveRecord::Base
	has_one :profile
	has_secure_password

  # --- HELPER METHODS ---

  def has_profile?
    return self.profile ? true : false
  end

end
