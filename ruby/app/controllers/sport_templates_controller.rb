class SportTemplatesController < ApplicationController
  
  before_filter :authenticate_user!  

  def index
    sport_templates = SportTemplate.all
    render json: sport_templates
  end

end
