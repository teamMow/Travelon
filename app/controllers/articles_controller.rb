class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_article, only:[:show, :edit, :update, :destroy]

  def new
  	@article =  Article.new
  end

  def create
  	@article = Article.new(article_params)
  	# @article = Article.new(title: params[:title], content: params[:content])
  	# @article = Article.new
  	# @article.title = params[:title]
  	# @article.content =params[:content]
  	@article.user_id = current_user.id

  	if @article.save
  		redirect_to @article, notice: '投稿が成功しました'
  		# redirect_to article_path(@article.id)
    else
    	render :new
    end
  end

  def index
  	@articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
  	@article.update(article_params)
  	# @article.title = params[:title]
  	# @article.content = params[:content]
  	# @article.area = params[:area]
  	if @article.save
  		redirect_to @article, notice: '投稿が更新されました'
  		# redirect_to article_path(@article.id)
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
  		params.require(:article).permit(:title, :content, :area, :img, :doya, :user_id)
  	end
end