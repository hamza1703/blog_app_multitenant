# frozen_string_literal: true

class HomeController < ApplicationController

  # GET /home/index
  def index
    render 'home/index'
  end

  # GET /home/get_companies
  def show
    @companies = User.unscoped.select('companies.name, companies.subdomain').where(email: params[:email]).joins(:company)

  end
end
