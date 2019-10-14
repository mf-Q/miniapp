class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

    def index
        @articles = Article.all.order("id DESC").page(params[:page]).per(5)
    end

    def show
        @articles = Article.find(params[:id])
   end

    def new
        @article = Article.new
    end

    def edit
         @article = Article.find(params[:id]) 
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params) if user_signed_in?
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy if user_signed_in?
    end


    def create
      @article = Article.create(article_params)
    end

    private
    def article_params
      params.require(:article).permit(:title, :content, :date).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

  end

  #   def create
  #       Article.create(blog_params)
  #       redirect_to controller: :blogs, action: :index
  #   end
  # private
  #   def blog_params
  #       #params.require(:article).permit(:title, :content, :date)
  #   end

