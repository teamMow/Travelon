class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:edit, :update, :destroy, :show, :likes, :follows, :followers]

	def edit
	end

	def update
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def index
		@users = User.page(params[:page]).per(6).order(created_at: :desc)
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	def show
	end

	def likes
	end

	def follows
	end

	def followers
	end



	private
		def set_user
			@user = User.find(params[:id])#.includes(:articles)
		end

		def user_params
			params.require(:user).permit(:name, :birthplace, :sex, :age)
		end

end
