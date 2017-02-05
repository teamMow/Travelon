class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:edit, :update, :destroy, :show, :likes]

	def edit
	end

	def update
		@user.name = params[:user][:name]
		@user.birthplace = params[:user][:birthplace]
		@user.sex = params[:user][:sex]
		@user.age = params[:user][:age]
		@user.save
		redirect_to user_path(@user.id)
	end

	def index
		@users = User.page(params[:page]).per(5)
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	def show
	end

	def likes
		# @user = User.find(params[:id])
	end

	private
		def set_user
			@user = User.find(params[:id])#.includes(:articles)
		end

end
