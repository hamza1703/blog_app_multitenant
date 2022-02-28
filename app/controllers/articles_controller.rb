# frozen_string_literal: true

class ArticlesController < ApplicationController
  load_and_authorize_resource find_by: :sequence_num
  add_breadcrumb 'index', :welcome_index_url
  add_breadcrumb 'articles', :articles_url
  # GET /articles
  def index; end

  # GET /articles/:id

  def show
    add_breadcrumb 'show', :article_url
  end

  # GET /articles/new
  def new; end

  # GET /articles/:id/edit
  def edit
    add_breadcrumb 'show', :edit_article_url
    respond_to do |format|
      format.html
    end
  end

  # POST /articles
  def create
    @article.user_id = User.current_user.id
    respond_to do |format|
      format.html do
        if @article.save
          redirect_to @article
        else
          render 'new'
        end
      end
    end
  end

  # PATCH /articles/:id
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private # params

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
