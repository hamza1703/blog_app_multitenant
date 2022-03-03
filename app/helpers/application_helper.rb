# frozen_string_literal: true

module ApplicationHelper
  def check_user_role
    User.current_user.role_id == User::ROLES[:Admin] ? 'Admin' : User.current_user.name
  end
end
