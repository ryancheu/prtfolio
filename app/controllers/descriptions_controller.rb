# Primary Author: anuhyag
class DescriptionsController < ApplicationController
  before_action :set_description, only: [:show, :edit, :update, :destroy]

  # GET /descriptions
  # GET /descriptions.json
  def index
    @descriptions = Description.all
  end

  # GET /descriptions/1
  # GET /descriptions/1.json
  def show
  end

  # GET /descriptions/new
  def new
    puts params.to_yaml
    @description = Description.new
    @block_id = params[:block_id]
    @res_pos = params[:res_pos]
  end

  # GET /descriptions/1/edit
  def edit
  end

  # POST /descriptions
  # POST /descriptions.json
  def create
    @description = Description.new(description_params)
    puts params.to_yaml
    puts block_params.to_yaml
    # NOTE: @description.block cannot be used because of the polymorphic association (Rails looks for a column resource_id that does not exist), so we have to set up the assocation in a more roundabout way
    @block = Block.find(block_params[:block_id])
    @res_pos = block_params[:res_pos]
    puts "created Description for block #{@block.id} at position #{@res_pos}"
    respond_to do |format|
      if @description.save
        format.js
      end
    end
  end

  # PATCH/PUT /descriptions/1
  # PATCH/PUT /descriptions/1.json
  def update
    respond_to do |format|
      if @description.update(description_params)
        format.html { redirect_to @description, notice: 'Description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descriptions/1
  # DELETE /descriptions/1.json
  def destroy
    @description.destroy
    respond_to do |format|
      format.html { redirect_to descriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description
      @description = Description.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def description_params
      params.require(:description).permit(:title, :content)
    end

    def block_params
      params.require(:description).permit(:block_id, :res_pos)
    end
end
