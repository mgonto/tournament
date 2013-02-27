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
    elsif params[:user][:facebook_token]
      create_or_get_facebook_user
    else
       raise ArgumentError.new("Email or Facebook token are required")
    end
  end

  def destroy
    # Todo implement
  end

  def login
    if params[:user][:email]
      @user = User.where(email: params[:user][:email]).first 
      raise SecurityError.new("Invalid email or password.") if @user.nil? || !@user.valid_password?(params[:user][:password])
      respond_with @user, status: :ok
    elsif params[:user][:facebook_token]
      create_or_get_facebook_user
    else
      raise ArgumentError.new("Email or Facebook token are required")
    end
  end

  def facebook_user
    @graph = Koala::Facebook::API.new(params[:user][:facebook_token])
    @facebook_user = @graph.get_object("me")
  end

  def create_or_get_facebook_user
    @facebook_user = facebook_user
    @user = User.where(facebook_id: @facebook_user["id"]).first
    if @user
      respond_with @user, status: :ok
    else 
      @user = User.from_facebook_user(facebook_user, params[:user][:facebook_token])
      if @user.save
        respond_with @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end
end