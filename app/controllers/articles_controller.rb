class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def create

  	@article = Article.new(article_params)
    @article.save
    ArticleNotificationMailer.article_create_notification(current_user, @article).deliver_now
    redirect_to articles_path
  end

  def update
  	@article = Article.find(params[:id])
  	@article.update_attributes(article_params)
  	redirect_to articles_path
  end

  private

  def article_params
  	params.require(:article).permit(:description)
  end
end
