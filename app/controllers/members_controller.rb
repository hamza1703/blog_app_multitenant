# frozen_string_literal: true

class MembersController < ApplicationController
  load_and_authorize_resource class: User
  add_breadcrumb 'index', :welcome_index_url
  add_breadcrumb 'members', :members_url

  # GET /members
  def index; end

  # GET /members/:id
  def show; end

  # GET /members/new
  def new
    # authorize! :create, @user
    add_breadcrumb 'new', :new_member_url
  end

  # GET /members/:id/edit
  def edit
    add_breadcrumb 'edit', :edit_member_url
  end

  # POST /members
  def create
    @member.role_id = User::ROLES[:User]

    @member.company_id = User.current_user.company_id

    if @member.save
      redirect_to welcome_index_url
    else
      render 'new'
    end
  end

  # PATCH /members/:id
  def update
    if @member.update!(member_params)
      redirect_to members_url
    else
      render 'edit'
    end
  end

  # DELETE /members/:id
  def destroy
    @member.destroy

    redirect_to members_path
  end

  private

  def member_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
