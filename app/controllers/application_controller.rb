class ApplicationController < ActionController::Base
	around_action :set_current_tenant


  def set_current_tenant
    binding.pry
     # company_object = Company.find(User.find_by(email:params[:user][:email]).company_id)
     # Company.set_current_tenant company_object.company_id
    yield
  end 

end
