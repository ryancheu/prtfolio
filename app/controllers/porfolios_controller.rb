class PorfoliosController < ApplicationController
  before_action :set_porfolio, only: [:show, :edit, :update, :destroy]

  def index
    @porfolios = Porfolio.all
  end

  def show
  end

  def new
    @porfolio = Porfolio.new
  end

  def edit
  end

  def create
    @porfolio = Porfolio.new(porfolio_params)

    respond_to do |format|
      if @porfolio.save
        format.html { redirect_to @porfolio, notice: 'Porfolio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @porfolio }
      else
        format.html { render action: 'new' }
        format.json { render json: @porfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @porfolio.update(porfolio_params)
        format.html { redirect_to @porfolio, notice: 'Porfolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @porfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @porfolio.destroy
    respond_to do |format|
      format.html { redirect_to porfolios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_porfolio
      @porfolio = Porfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def porfolio_params
      params[:porfolio]
    end
end
