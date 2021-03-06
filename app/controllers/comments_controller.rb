class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to articles_path(@comment.article)
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end