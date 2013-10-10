class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(params[:user].permit(:first_name, :last_name, :email, :password))
    
    if @user.save
  		redirect_to @user
  	else
  		render 'new'
  	end
end

def show
	@user = User.find(params[:id])
end

def index
	@users = User.all
end

def sign_in
	@user = User.new
end

def authenticate
	@user = User.where( { email: params[:user][:email], password: params[:user][:password] } ).first
		
	if @user.nil?
		flash[:error] = 'Invalid email or password'
		redirect_to sign_in_path
	else
		redirect_to posts_path
	end
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	@user.update(params[:user].permit(:first_name, :last_name, :email, :password))
	redirect_to @user
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to users_path
end

end
