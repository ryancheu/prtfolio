# Primary Author: psaylor
class TemplatesController < ApplicationController
  include BlocksHelper
  
  # Show the template with this id
  def show
    @id = params[:id]
  end
end
