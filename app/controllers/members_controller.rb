# frozen_string_literal: true

class MembersController < ApplicationController
  load_and_authorize_resource class: User
  add_breadcrumb "index", :welcome_index_url
  add_breadcrumb "members", :members_url

  # GET /members
  def index

    # authorize! :create, @user

    @users = User.all
  end

  # GET /members/:id
  def show

    authorize! :read, @user

    @user = User.find(params[:id])
  end

  # GET /members/new
  def new
    # authorize! :create, @user
    add_breadcrumb "new", :new_member_url

    @user = User.new
  end

  # GET /members/:id/edit
  def edit
    add_breadcrumb "edit", :edit_member_url

    @user = User.find(params[:id])
  end

  # POST /members
  def create
    # authorize! :create, @user
    @user = User.new(user_params)
    @user.role_id = User::ROLES[:User]
    @user.company_id = User.current_user.company_id

    if @user.save
      redirect_to welcome_index_url
    else
      render 'new'
    end
  end

  # PATCH /members/:id
  def update
    # authorize! :update, @user

    @user = User.find(params[:id])

    if @user.update!(user_params)
      # redirect_to member_url(@user)
      redirect_to members_url
    else
      render 'edit'
    end
  end

  # DELETE /members/:id
  def destroy
    # authorize! :destroy, @user
    @user = User.find(params[:id])
    @user.destroy

    redirect_to members_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
