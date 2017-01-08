class ArticlesController < ApplicationController
	before_action :set_article, only:[:show, :edit, :update, :destroy]

  def new
  end

  def create
  	@article = Article.new(article_params)
  	# @article = Article.new(title: params[:title], content: params[:content])
  	# @article = Article.new
  	# @article.title = params[:title]
  	# @article.content =params[:content]
  	@article.save
  	redirect_to article_path(@article.id)
  end

  def index
  	@articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
  	@article.title = params[:title]
  	@article.content = params[:content]
  	@article.area = params[:area]
  	@article.save
  	redirect_to article_path(@article.id)
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
  		params.require(:article).permit(:title, :content, :area, :img)
  	end

end
