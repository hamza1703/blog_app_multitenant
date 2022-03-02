# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :find_user_companies
  add_breadcrumb 'index', :welcome_index_url

  def index
    @pagy, @articles = pagy(Company.current_tenant.articles, items: 5)
    
  end

  def find_user_companies; end
end
