class SessionsController < ApplicationController
	skip_before_action :ensure_login, only: [:new, :create]

	# Checks for current sessions
	def new
		if is_logged_in?
			puts "LOG: logged in!"
			redirect_to root_path, notice: "Ya existe una sesión activa."
		else
			puts "LOG: not logged in"
		end
	end

	# Creates a new session
	def create 
		puts "LOG: Creating a new session"
		user_email = params[:user][:email]
		user_password = params[:user][:password]
		user = User.find_by(email: user_email).try(:authenticate, user_password)

		if user
			session[:user_id] = user.id
			redirect_to root_path, notice: "¡Bienvenido #{user.email}!"
		else
			redirect_to login_path, alert: "El usuario y contraseña no coinciden o no existen."
		end
	end

	# Terminates a session
	def destroy
		reset_session
		redirect_to login_path, notice: "Sesión cerrada."
	end
end
