class ArticlesController < ApplicationController
before_action :set_article, only: %i[show edit destroy]
  
  def index 
      @articles = Article.all
  end

  def show
    @comment = @article.comments.build
    @comments = Comment.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create 
    @article = Article.new(articles_params)
    if @article.save 
      flash[:success] = 'Artcile created'
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit 
  end

  def update 
    if article.update(articles_params)
      flash[:success] = 'Artcile updated'
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article deleted'
    redirect_to articles_path
  end

  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end


end
