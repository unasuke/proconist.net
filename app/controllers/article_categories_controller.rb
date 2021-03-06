class ArticleCategoriesController < ApplicationController
  def show
    @articles = Article.published.all.order(created_at: :desc)
    @category = ArticleCategory.includes(:articles).find_by(url: params[:url])
    @categories = ArticleCategory.all
  end

  def index
    @articles = Article.published.all.order(created_at: :desc)
    @categories = ArticleCategory.includes(:articles).all
  end
end
