# frozen_string_literal: true

class ArticlesController < ApplicationController
  load_and_authorize_resource find_by: :sequence_num
  add_breadcrumb 'index', :welcome_index_url
  # GET /articles
  def index
    @articles = current_user.articles.paginate(page: params[:page], per_page: PER_PAGE)
  end

  # GET /articles/:id

  def show
    @comments = @article.comments
    add_breadcrumb 'show', :article_url
  end

  # GET /articles/new
  def new
    add_breadcrumb 'new', :new_article_url
  end

  # GET /articles/:id/edit
  def edit
    respond_to do |format|
      format.html
    end
    add_breadcrumb 'edit', :edit_article_url

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
