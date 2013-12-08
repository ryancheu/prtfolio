# Primary Author: psaylor
require 'net/http'
class CodesController < ApplicationController
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  before_action :set_gists, only: [:new, :create, :edit, :update]

  include GistHelper

  def index
    @codes = Code.all
  end

  def show
  end

  def new
    @code = Code.new
  end

  def edit
  end


  def create
    @code = Code.new(code_params)
    respond_to do |format|
      unless @code.save
        puts "there were errors saving!"
        format.html { render action: 'new' }
        format.json { render json: @code.errors, status: :unprocessable_entity }
        
      else
        puts "returning code!"
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    def set_gists
      @gist_ids = @gist_ids || get_gist_ids(current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_params
      params.require(:code).permit(:gist_id, :content, :link, :language)
    end
end
