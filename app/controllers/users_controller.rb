class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, ]

  def show
    @user = User.find(params[:id])
  end

  def edit
    if auth_user
    else
      redirect_to users_url
    end
  end

  def index
    @users = User.all
  end

  def update
    set_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :image)
    end

    def auth_user
      set_user
      authorize @user, :edit?
    end
end
