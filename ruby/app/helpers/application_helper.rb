module ApplicationHelper

  def facebook_user
    @graph = Koala::Facebook::API.new(params[:user][:facebook_token])
    @facebook_user = @graph.get_object("me")
  end

  def create_or_get_facebook_user
    @facebook_user = facebook_user
    @user = User.where(facebook_id: @facebook_user["id"]).first
    if @user
      render template: 'registrations/create', status: :ok
    else 
      @user = User.from_facebook_user(facebook_user, params[:user][:facebook_token])
      if @user.save
        render template: 'registrations/create', status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end


end
