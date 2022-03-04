# frozen_string_literal: true

module ApplicationHelper
  def check_user_role
    User.current_user.role_id == User::ROLES[:Admin] ? ADMIN : User.current_user.name
  end

  def email_change resource
    resource.try(:unconfirmed_email?) ? resource.unconfirmed_email : resource.email
  end
end
