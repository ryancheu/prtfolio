class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  

  def index
    @users = User.all
  end

  def show
    @portfolio = @user.portfolio
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Portfl.io!"
      @portfolio = current_user.create_portfolio()
      @portfolio.save
      redirect_to @user.portfolio
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      params[:user].delete(:password) if params[:user][:password].blank?    
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # Users cannot be destroyed yet
  def destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # check for when a user is viewing a different user's profile
    def correct_user
        msg = "You do not have permission to update another user's information"
        require_correct_user(@user, msg)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation)
    end

end
