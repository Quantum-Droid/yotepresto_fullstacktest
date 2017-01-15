class User < ActiveRecord::Base
	has_one :profile
	has_secure_password
end
