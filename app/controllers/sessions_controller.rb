class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by(email: params[:session][:email])
	if user && user.password == params[:session][:password]
		redirect_to posts_path
	else
		render 'new'
	end
end

def destroy
end

end
