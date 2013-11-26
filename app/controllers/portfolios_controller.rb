# Primary Author: psaylor
class PortfoliosController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_no_portfolio, only: [:new, :create]
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def show
  end

  def new
    @portfolio = current_user.new_portfolio()
  end

  def edit
  end

  def create
    @portfolio = current_user.new_portfolio()
    if @portfolio.save
      redirect_to @portfolio
    else
      render 'new'
    end
    
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
      @projects = @portfolio.projects
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params[:portfolio]
    end

    # Redirects to the current user's portfolio if she already has one
    def require_no_portfolio
      if current_user.has_portfolio?
        flash[:warning] = "You already have a portfolio"
        redirect_to current_user.portfolio
      end
    end

    def require_owner
      msg = "You do not have permission to modify this portfolio"
      redirect_path = portfolio_path(@portfolio)
      require_correct_user(@portfolio.user, msg, redirect_path)
    end
end
