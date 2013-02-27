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

  def valid_facebook_attributes 
    {"facebook_token" => "BAABxOZCc0HksBAAUIAeT6mXe5O7gFZCaWljwM9qXAxTiZB9DFUXp0Tneh98yZAWcYOW8sj5x3X0LU4HSECLAyghJcPKT35H1hZAYO23hfuh9rGmQuULBG"}
  end

  def invalid_facebook_attributes 
    {"facebook_token" => "422"}
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

  

    describe "with valid facebook params" do 
      it "creates a new User" do
        VCR.use_cassette('gonto_facebook') do
          expect {
              post v1_users_path, :user => valid_facebook_attributes, :format => :json
            }.to change(User, :count).by(1)
        end
      end

      it "responds 201" do
        VCR.use_cassette('gonto_facebook') do
          post v1_users_path, :user => valid_facebook_attributes, :format => :json
          response.status.should be(201)
        end
      end

      it "returns the JSon user" do
        VCR.use_cassette('gonto_facebook') do
          post v1_users_path, :user => valid_facebook_attributes, :format => :json
          response.body.should have_json_path("email")
          response.body.should have_json_path("authentication_token")
          response.body.should have_json_path("_id")
        end
      end
    end

    describe "with invalid emails params" do
      it "will return 422" do
        VCR.use_cassette('invalid_facebook') do
          post v1_users_path :user => invalid_facebook_attributes, :format => :json
          response.status.should be(422)
        end
      end
    end

    describe "login with email" do 
      it "will return 200" do
        @user = Fabricate(:normal_user)
        post login_v1_users_path, :user => {email: @user.email, password: @user.password }, :format => :json
        response.status.should be(200)
      end

      it "will return 403 for wrong mail" do
        @user = Fabricate(:normal_user)
        post login_v1_users_path, :user => {email: "gogo@gogo.com", password: @user.password }, :format => :json
        response.status.should be(403)
      end

      it "will return 403 for wrong password" do
        @user = Fabricate(:normal_user)
        post login_v1_users_path, :user => {email: @user.email, password: "this isnt the pass dude" }, :format => :json
        response.status.should be(403)
      end

    end

    describe "login with facebook" do 
      it "will return 201 for non existent facebook" do
        VCR.use_cassette('gonto_facebook') do
          post login_v1_users_path, :user => valid_facebook_attributes, :format => :json
          response.status.should be(201)
        end
      end

      it "will return 200 for non existent facebook" do
        VCR.use_cassette('gonto_facebook') do
          @user = Fabricate(:facebook_user)
          post login_v1_users_path, :user => {"facebook_token" => @user.facebook_token}, :format => :json
          response.status.should be(200)
        end
      end

    end


  

end
