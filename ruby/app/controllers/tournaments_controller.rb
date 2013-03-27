class TournamentsController < ApplicationController
  
  before_filter :authenticate_user!  

  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
      render json: @tournament
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
    
  end

end
