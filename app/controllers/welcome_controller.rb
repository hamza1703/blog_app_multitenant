# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :find_user_companies
  add_breadcrumb 'index', :welcome_index_url

  # GET /articles
  def index
    @articles = Company.current_tenant.articles.paginate(page: params[:page], per_page: PER_PAGE)
    respond_to do |format|
      format.html
      format.json { render json: { articles: @articles } }
    end
  end

  def find_user_companies; end
end
