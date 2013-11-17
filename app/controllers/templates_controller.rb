#  primary author: saylorp
class TemplatesController < ApplicationController
  # Show the template with this id
  def show
    @id = params[:id]
  end
end
