class LikesController < ApplicationController
	before_action :authenticate_user!


	def create
		@article = Article.find(params[:article_id])
		@like = current_user.likes.build(article: @article)

		if @like.save
			redirect_to articles_path(@article), notice: "いいねしました"
			logger.info "いいねしました"
		else
			redirect_to articles_path(@article), alert: "いいねできません"
		end
	end

	def destroy
		@like = current_user.likes.find_by!(article_id: params[:article_id])
		@like.destroy
		redirect_to articles_path, notice: "いいねを削除しました"
	end

end
