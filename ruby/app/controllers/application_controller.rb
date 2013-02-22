class ApplicationController < ActionController::Base

  #Errors
  rescue_from ArgumentError do |ex|
    render json: {errors: ex.message, status: 422}.to_json, status: 422
  end 
  
  #Hook for taking the auth_token from the header and 
  #inserting it in to the params
  prepend_before_filter :get_auth_token

  private
  
    def get_auth_token
      if auth_token = params[:auth_token].blank? && request.headers["Auth_token"]
        params[:auth_token] = auth_token
      end
    end 
end
