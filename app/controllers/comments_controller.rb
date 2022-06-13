class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :set_article
  
  def def create
    @comment = @article.comments.build comment_params
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to article_path(@article) 
    else
      @comments = @article.comments.order created_at: :desc
      flash[:error] = "Something went wrong"
      render 'articles/show/'
    end
  end
  
  def edit; end
  
  def update
    if comment.update comment_params
      flash[:success] = 'Comment updated'
      redirect_to article_path(@article)
    else
      @comments = @article.comments.order created_at: :desc
      flash[:error] = "Something went wrong"
      render 'articles/show/'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to article_path(@article)
  end
  
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end


end
