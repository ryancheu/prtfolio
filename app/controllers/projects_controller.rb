# Primary Author: psaylor
class ProjectsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_portfolio, only: [:new, :create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:edit, :update, :destroy]

  include GistHelper
  include ProjectsHelper
  include BlocksHelper

  def index
    @projects = Project.all
  end

  def show
    @blocks = get_full_blocks_for_project(@project)
    @user  = @project.get_owner()
  end

  def edit
  end

  def create
    @project = current_user.new_project

    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_project_path @project }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user  = @project.get_owner()
    portfolio = @project.portfolio
    @project.destroy
    @projects = portfolio.projects 
    respond_to do |format|
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :image_id)
    end

    # Redirects the user to create a portfolio if she does not have one already
    def require_portfolio
      unless current_user.has_portfolio?
        flash[:warning] = "You must first create a portfolio"
        redirect_to new_portfolio_path
      end
    end

    def require_owner
      msg = "You do not have permission to modify this project"
      redirect_path = project_path(@project)
      require_correct_user(@project.get_owner, msg, redirect_path)
    end
end
