# Primary Author: ryan
class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
    @block_id = params[:block_id]
    @res_pos = params[:res_pos]
    puts "proj id"
    puts params[:project_id]
    @project = params[:project_id]
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    # NOTE: @image.block cannot be used because of the polymorphic association (Rails looks for a column resource_id that does not exist)
    if Block.exists?(block_params[:block_id])
      @block = Block.find(block_params[:block_id])
      @res_pos = block_params[:res_pos]
      puts "created Description for block #{@block.id} at position #{@res_pos}"
    end
    
    puts "project: "
    puts project_params[:project_id]
    if Project.exists?(project_params[:project_id])
      @project = Project.find(project_params[:project_id])
    end


    respond_to do |format|
      if @image.save
        format.js
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:content)
    end

    def block_params
      params.require(:image).permit(:block_id, :res_pos)
    end

    def project_params
      params.require(:image).permit(:project_id)
    end
end
