class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
		# Returns the currently logged in user or nil if there isn't one
		def current_user
			return unless session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end

		# Torna o usuario logado disponivel para modelos como helper
		helper_method :current_user
		
		# Filtro para impor login
		def authenticate
			logged_in? || access_denied
		end

		# Método para testar usuario logado
		def logged_in?
			current_user.is_a? User
		end

		# Torna o 'usuario logado?'' disponivel para modelos como helper
		helper_method :logged_in?
		
		def access_denied
			redirect_to login_path, notice: "Please log in to continue" and return false
		end
end
