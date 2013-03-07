require 'spec_helper'

describe RegistrationsController do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlacesController. Be sure to keep this updated too.
  describe "POST create" do
    describe "with valid emails params" do
      it "creates a new User" do
        expect {
          post user_registration_path, :user => valid_attributes, :format => :json
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post user_registration_path, :user => valid_attributes, :format => :json
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "responds 201" do
        post user_registration_path, :user => valid_attributes, :format => :json
        response.status.should be(201)
      end

      it "returns the JSon user" do
        post user_registration_path, :user => valid_attributes, :format => :json
        response.body.should have_json_path("email")
        response.body.should have_json_path("authentication_token")
        response.body.should have_json_path("_id")
      end
    end

    describe "with invalid emails params" do
      it "will return 422" do
        post user_registration_path :user => invalid_attributes, :format => :json
        response.status.should be(422)
      end
    end
  end

  

    describe "with valid facebook params" do 
      it "creates a new User" do
        VCR.use_cassette('gonto_facebook') do
          expect {
              post user_registration_path, :user => valid_facebook_attributes, :format => :json
            }.to change(User, :count).by(1)
        end
      end

      it "responds 201" do
        VCR.use_cassette('gonto_facebook') do
          post user_registration_path, :user => valid_facebook_attributes, :format => :json
          response.status.should be(201)
        end
      end

      it "returns the JSon user" do
        VCR.use_cassette('gonto_facebook') do
          post user_registration_path, :user => valid_facebook_attributes, :format => :json
          response.body.should have_json_path("email")
          response.body.should have_json_path("authentication_token")
          response.body.should have_json_path("_id")
        end
      end
    end

    describe "with invalid emails params" do
      it "will return 422" do
        VCR.use_cassette('invalid_facebook') do
          post user_registration_path :user => invalid_facebook_attributes, :format => :json
          response.status.should be(422)
        end
      end
    end

end
