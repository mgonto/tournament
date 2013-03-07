require 'spec_helper'

describe SessionsController do

    describe "login with email" do 
      it "will return 200" do
        @user = Fabricate(:normal_user)
        post user_session_path, :user => {email: @user.email, password: @user.password }, :format => :json
        response.status.should be(200)
      end

      it "will return auth token" do
        @user = Fabricate(:normal_user)
        post user_session_path, :user => {email: @user.email, password: @user.password }, :format => :json
        response.body.should have_json_path("authentication_token")
      end

      it "will return 403 for wrong mail" do
        @user = Fabricate(:normal_user)
        post user_session_path, :user => {email: "gogo@gogo.com", password: @user.password }, :format => :json
        response.status.should be(403)
      end

      it "will return 403 for wrong password" do
        @user = Fabricate(:normal_user)
        post user_session_path, :user => {email: @user.email, password: "this isnt the pass dude" }, :format => :json
        response.status.should be(403)
      end

    end

    describe "login with facebook" do 
      it "will return 201 for non existent facebook" do
        VCR.use_cassette('gonto_facebook') do
          post user_session_path, :user => valid_facebook_attributes, :format => :json
          response.status.should be(201)
        end
      end

      it "will return 200 for non existent facebook" do
        VCR.use_cassette('gonto_facebook') do
          @user = Fabricate(:facebook_user)
          post user_session_path, :user => {"facebook_token" => @user.facebook_token}, :format => :json
          response.status.should be(200)
        end
      end

      it "will return auth token" do
        VCR.use_cassette('gonto_facebook') do
          @user = Fabricate(:facebook_user)
          post user_session_path, :user => {"facebook_token" => @user.facebook_token}, :format => :json
          response.body.should have_json_path("authentication_token")
        end
      end

    end

end    