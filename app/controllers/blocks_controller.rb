# Primary Author: psaylor
class BlocksController < ApplicationController
  before_action :set_project
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  include BlocksHelper
  include GistHelper

  def index
    @blocks = @project.blocks
  end

  def show
    puts @block.firstres
  end

  def new
    @block = @project.blocks.build
    @gist_ids = get_gist_ids(current_user)
  end

  def edit
    @gist_ids = get_gist_ids(current_user)
  end

  def create
    # render_as_yaml params
    @block = @project.blocks.build(block_params)
    if @block.save
      redirect_to edit_project_path(@project)
    else 
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to [@project, @block], notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to project_blocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = @project.blocks.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:template_id, :firstres_id, :firstres_type, :secondres_id, :secondres_type)
    end
end
