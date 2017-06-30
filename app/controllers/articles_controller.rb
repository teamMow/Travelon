class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def new
  	@article =  Article.new
  end

  def create
  	@article = Article.new(article_params)
  	# @article.user_id = current_user.id

  	if @article.save
    		redirect_to @article, notice: '投稿が成功しました'
      else
      	render :new
      end
  end

  def index
  	@articles = Article.page(params[:page]).per(9).includes(:user).order(created_at: :desc)
  end

  def show
    @user = current_user.id
  end

  def edit
  end

  def update
    	@article.update(article_params)
    	if @article.save
    		redirect_to @article, notice: '投稿が更新されました'
      else
      	render :edit
      end
  end

  def destroy
  	@article.destroy
  	redirect_to articles_path
  end



  private
  	def set_article
  		@article = Article.find(params[:id])
  	end

  	def article_params
  		params.require(:article).permit(:title, :content, :area, :img, :user_id, :doya, :hobby, :user_id)
  	end

    def correct_user
        article = Article.find(params[:id])
        if current_user.id != article.user.id
          redirect_to root_path
        end
    end
end

