# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_subdomain, only: :new
  around_action :set_current_tenant

  def set_current_tenant
    company_object = Company.find_by(subdomain: request.subdomain)

    if company_object.present?
      Company.current_tenant_id = company_object.id
      User.current_user = current_user

    end
    yield

    Company.current_tenant_id = nil
    User.current_user = nil
  end

  def authenticate_subdomain
    redirect_to '/home/index' unless request.subdomain.present?
  end
end
