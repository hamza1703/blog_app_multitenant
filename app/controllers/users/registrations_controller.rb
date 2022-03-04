# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_subdomain, only: :new
    # POST /resource
    def create
      user = User.new(user_params)
      user.role_id = User::ROLES[:Admin]
      redirect_to new_user_session_url(subdomain: user.company.subdomain) if user.save!
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, company_attributes: [:name, :subdomain])
    end
  end
end
