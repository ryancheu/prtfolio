class ProjectsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  include GistHelper

  def index
    @projects = Project.all
  end

  def show
  end

  def new
<<<<<<< HEAD
    @project = Project.new
    
=======
    @project = current_user.new_project()
    @gist_ids = get_gist_ids(current_user)
>>>>>>> master
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.update_attribute(:portfolio_id, current_user.portfolio_id)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
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
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
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
      params[:project]
    end
end
