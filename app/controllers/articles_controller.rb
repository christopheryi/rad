class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    #will have template
    @articles = Article.all
  end

  def show
    #will have template
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id

  end

  def new #will send user to a form
    #will have template
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end


  def edit
    #will have template
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
    
end
