require 'spec_helper'

describe SportTemplatesController do

  describe "GET 'index'" do
    
    describe "no credentials" do

      it "should return unauthorized when not logged in" do
        get :index, :format => :json
        response.status.should eq 401
      end

    end

    describe "with credentials" do

      before do
        login Fabricate(:normal_user)
        Fabricate :soccer_template
      end  

      it "should return ok" do
        get :index, :format => :json
        response.status.should eq 200
      end

      it "should list sport_templates" do
        get :index, :format => :json
        response.body.should have_json_path("sport_templates")
      end

    end  

  end

end
