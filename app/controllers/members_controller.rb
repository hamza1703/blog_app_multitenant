# frozen_string_literal: true

class MembersController < ApplicationController
  load_and_authorize_resource class: User
  add_breadcrumb 'index', :welcome_index_url
  add_breadcrumb 'members', :members_url

  # GET /members
  def index
    @members = User.all.paginate(page: params[:page], per_page: PER_PAGE)
    respond_to do |format|
      format.html
      format.json { render json: { members: @members } }
    end
  end

  # GET /members/:id
  def show
    respond_to do |format|
      format.html
    end
  end

  # GET /members/new
  def new
    add_breadcrumb 'new', :new_member_url
    respond_to do |format|
      format.html
    end
  end

  # GET /members/:id/edit
  def edit
    add_breadcrumb 'edit', :edit_member_url
    respond_to do |format|
      format.html
    end
  end

  # POST /members
  def create
    @member.role_id = User::ROLES[:User]
    @member.company_id = User.current_user.company_id
    is_successful = @member.save
    respond_to do |format|
      format.html do
        if is_successful
          redirect_to welcome_index_url
        else
          render 'new'
        end
      end
    end
  end

  # PATCH /members/:id
  def update
    is_successful = @member.update(member_params)
    respond_to do |format|
      format.html do
        if is_successful
          redirect_to members_url
        else
          render 'edit'
        end
      end
    end
  end

  # DELETE /members/:id
  def destroy
    @member.destroy
    is_destroyed = @member.destroyed?
    respond_to do |format|
      format.html do
        if is_destroyed
          redirect_to members_path
        end
      end
    end
  end

  private

  def member_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
