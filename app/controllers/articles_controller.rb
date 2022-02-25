# frozen_string_literal: true

class ArticlesController < ApplicationController
  load_and_authorize_resource
add_breadcrumb "index", :welcome_index_url
  add_breadcrumb "articles", :articles_url
  # GET /articles
  def index; end

  # GET /articles/:id

  def show
  add_breadcrumb "show", :article_url

  end

  # GET /articles/new
  def new; end

  # GET /articles/:id/edit
  def edit
  add_breadcrumb "show", :edit_article_url

  end

  # POST /articles
  def create
    @article = User.current_user.articles.build(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # PATCH /articles/:id
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private # params

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
