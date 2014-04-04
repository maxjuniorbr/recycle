class SessionsController < ApplicationController
	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			redirect_to root_path, :notice => "Logado com sucesso."
		else
			flash.now[:alert] = "Combinação de email e senha inválidos."
			render :action => 'new'
		end
	end

	def destroy
		reset_session
		redirect_to root_path, :notice => "Deslogado com sucesso."
	end
end
