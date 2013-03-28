class TournamentsController < ApplicationController
  include ApplicationHelper

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
    @tournament = Tourney.find(params[:id])

    render json: @tournament
  end

  def share
    if params[:share][:facebook]
      @graph = facebook_user_with_token(params[:share][:facebook_token])
      graph.put_wall_post("explodingdog!", {:name => "i love loving you", :link => "http://www.explodingdog.com/title/ilovelovingyou.html"}, "tmiley")
    end
  end

end
