class V1::UsersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, :only => :destroy
  
  def create
    if params[:user][:email]
      @user = User.new(params[:user])
      if @user.save
        respond_with @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    elsif params[:facebook_token]
    else
       raise ArgumentError.new("Email or Facebook token are required")
    end
  end

  def destroy
  end

  def login
  end
end
