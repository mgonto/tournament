class SecuredController < ApplicationController
    before_filter :authenticate_user!
end