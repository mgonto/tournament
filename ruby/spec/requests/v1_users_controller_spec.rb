require 'spec_helper'

describe V1::UsersController do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlacesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  def valid_attributes
    { "email" => "gontoq@gonto.com", "password" => "1234567" }
  end

  def invalid_attributes
    { "email" => "gontoq", "password" => "1234567" }
  end


  describe "POST create" do
    describe "with valid emails params" do
      it "creates a new User" do
        expect {
          post v1_users_path, :user => valid_attributes, :format => :json
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post v1_users_path, :user => valid_attributes, :format => :json
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "responds 201" do
        post v1_users_path, :user => valid_attributes, :format => :json
        response.status.should be(201)
      end

      it "returns the JSon user" do
        post v1_users_path, :user => valid_attributes, :format => :json
        response.body.should have_json_path("email")
        response.body.should have_json_path("authentication_token")
        response.body.should have_json_path("_id")
      end
    end

    describe "with invalid emails params" do
      it "will return 422" do
        post v1_users_path :user => invalid_attributes, :format => :json
        response.status.should be(422)
      end
    end
  end

  

end
