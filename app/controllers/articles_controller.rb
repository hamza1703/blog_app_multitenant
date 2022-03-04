# frozen_string_literal: true

class ArticlesController < ApplicationController
  load_and_authorize_resource find_by: :sequence_num
  add_breadcrumb 'Articles', :welcome_index_url

  # GET /articles
  def index
    @articles = current_user.articles.paginate(page: params[:page], per_page: PER_PAGE)
    respond_to do |format|
      format.html
    end
  end

  # GET /articles/:id
  def show
    add_breadcrumb 'show', :article_url
    @comments = @article.comments
    respond_to do |format|
      format.html
    end
  end

  # GET /articles/new
  def new
    add_breadcrumb 'new', :new_article_url
    respond_to do |format|
      format.html
    end
  end

  # GET /articles/:id/edit
  def edit
    add_breadcrumb 'edit', :edit_article_url
    respond_to do |format|
      format.html
    end
  end

  # POST /articles
  def create
    @article.user_id = User.current_user.id
    is_successful = @article.save
    respond_to do |format|
      format.html do
        if is_successful
          flash[:notice] = t 'article_created'
          redirect_to @article
        else
          render 'new'
        end
      end
    end
  end

  # PATCH /articles/:id
  def update
    is_successful = @article.update(article_params)
    respond_to do |format|
      format.html do
        if is_successful
          flash[:notice] = t 'article_updated'
          redirect_to @article
        else
          flash[:alert] = t 'article_not_updated'
          render 'edit'
        end
      end
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    is_destroyed = @article.destroyed?
    respond_to do |format|
      format.html do
        if is_destroyed
          flash[:notice] = t 'article_deleted'
          redirect_to articles_path
        else
          flash[:alert] = t 'article_not_deleted'
          redirect_to articles_path
        end
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
