class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @portfolio = Portfolio.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Portfl.io!"
      build_portfolio
      @portfolio = Portfolio.where(user_id: @user.id).first
      @user.update_attribute(:portfolio_id, @portfolio.id)
      redirect_to @user.portfolio
    else
      render 'new'
    end
  end

  def build_portfolio
    Portfolio.create(user: current_user)
  end

  def update
    @user = User.find(params[:id])

    # check for when a user is viewing a different user's profile
    if @user != current_user
      format.html { redirect_to @user, notice: "You cannot update another user's info!" }
      format.json { head :no_content }
    end

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

  def destroy
    sign_out
    redirect_to root_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user == @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation)
    end
end
