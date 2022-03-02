# frozen_string_literal: true

class HomeController < ApplicationController
  # GET /home/index
  def index
    respond_to do |format|
      format.html { render 'home/index' }
    end
  end

  # GET /home/get_companies
  def show
    @companies = User.unscoped.select('companies.name, companies.subdomain').where(email: params[:email]).joins(:company)
    respond_to do |format|
      format.html
      format.json { render json: { companies: @companies } }
    end
  end
end
