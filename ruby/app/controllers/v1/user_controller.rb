class V1::UserController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, :only => :destroy
  def create
    if params[:user][:email]
      @user = User.new(params[:user])
      if @user.save
        render json: @user.as_json(except: [:password, :facebook_id, :facebook_token]), status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
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
