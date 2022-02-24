class MembersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.role_id = User::ROLES[:User]
    @user.company_id = User.current_user.company_id

    if @user.save
      redirect_to welcome_index_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to members_path
  end

  private #params
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
      
    end

end
