class ApplicationController < ActionController::Base
  before_action :authenticate_subdomain , only: :new
  around_action :set_current_tenant




  def set_current_tenant
    
    company_object = Company.find_by(subdomain: request.subdomain)
    if company_object.present?
      Company.current_tenant_id = company_object.id
    end

    yield
    Company.current_tenant_id = nil
    

  end

  def authenticate_subdomain

    if !request.subdomain.present?
      redirect_to "/home/index"
     
    end

  end 

end
