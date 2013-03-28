class TournamentsController < ApplicationController
  
  before_filter :authenticate_user!  

  def create
    @tournament = Tourney.new(params[:tournament])
    if @tournament.save
      render json: @tournament
    else
      binding.pry
      render json: @tournament.errors, status: :unprocessable_entity
    end
    
  end

  def show
  end

end
