class V1::UserController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, :only => :destroy
  def create
    if params[:email]
    else params[:facebook_token]
    else
       raise ArgumentError.new("Email or Facebook token are required")
    end
  end

  def destroy
  end

  def login
  end
end
