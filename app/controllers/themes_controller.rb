class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = Theme.all
  end

  def show
  end

  def new
    @theme = Theme.new
  end

  def edit
  end

  def create
    @theme = Theme.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
        format.json { render action: 'show', status: :created, location: @theme }
      else
        format.html { render action: 'new' }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to themes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params[:theme]
    end
end
