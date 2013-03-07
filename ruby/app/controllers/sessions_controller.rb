class SessionsController < Devise::SessionsController
  include ApplicationHelper

  #Errors
  rescue_from Koala::Facebook::AuthenticationError do |ex|
    render json: {errors: ex.message, status: 422}.to_json, status: 422
  end 

  def create
    if params[:user][:email]
      @user = User.where(email: params[:user][:email]).first 
      raise SecurityError.new("Invalid email or password.") if @user.nil? || !@user.valid_password?(params[:user][:password])
      render template: 'registrations/login', status: :ok
    elsif params[:user][:facebook_token]
      create_or_get_facebook_user
    else
      raise ArgumentError.new("Email or Facebook token are required")
    end
  end

end