class V1::UsersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, :only => :destroy

  #Errors
  rescue_from Koala::Facebook::AuthenticationError do |ex|
    render json: {errors: ex.message, status: 422}.to_json, status: 422
  end 

  
  
  def create
    if params[:user][:email]
      @user = User.new(params[:user])
      if @user.save
        respond_with @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    elsif 
      @graph = Koala::Facebook::API.new(params[:user][:facebook_token])
      @facebook_user = @graph.get_object("me")
      @user = User.from_facebook_user(@facebook_user, params[:user][:facebook_token])
      if @user.save
        respond_with @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
       raise ArgumentError.new("Email or Facebook token are required")
    end
  end

  def destroy
  end

  def login
  end
end
