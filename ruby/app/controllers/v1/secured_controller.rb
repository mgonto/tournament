class V1::SecuredController < ApplicationController
    before_filter :authenticate_user!

  def authenticate_user!
     authenticate_v1_user!
  end

  def current_user
    current_v1_user
  end
end