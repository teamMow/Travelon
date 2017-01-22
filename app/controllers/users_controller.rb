class UsersController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.name = params[:user][:name]
		@user.birthplace = params[:user][:birthplace]
		@user.sex = params[:user][:sex]
		@user.age = params[:user][:age]
		@user.save
		redirect_to user_path(@user.id)
	end

	def index
		@users = User.all
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def show
		@user = User.find{params[:id]}
	end



end
