# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render 'home/index'
  end

  def show
    @companies = User.unscoped.select('companies.name, companies.subdomain').where(email: params[:email]).joins(:company)
  end
end
