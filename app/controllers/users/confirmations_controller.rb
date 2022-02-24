# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
  def after_confirmation_path_for(resource_name, resource)
    return root_url if params[:confirmation_token].blank? || (resource = resource_class.find_by_confirmation_token(params[:confirmation_token])).blank? || resource.has_password?

    # Setting reset_password_token itself to reach reset password screen for the user
    resource = resource_class.find_by(confirmation_token: params[:confirmation_token])
    token    = Devise.token_generator.generate(resource_class, :reset_password_token)
    resource.update_columns({ reset_password_token: token.second, reset_password_sent_at: Time.now.utc })
    edit_user_password_url(resource, reset_password_token: token.first)
    binding.pry
  end
end
