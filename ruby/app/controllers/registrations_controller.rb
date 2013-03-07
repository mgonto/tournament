class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

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
        render template: 'registrations/create', status: :created
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

end