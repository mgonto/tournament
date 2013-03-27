require 'spec_helper'

describe TournamentsController do

  describe "Create" do
    it "creates a new Tournament" do
        expect {
          post tournaments_path, :tournament => valid_attributes, :format => :json
        }.to change(Tournament, :count).by(1)
    end


    it "responds 201" do
      post tournaments_path, :tournament => valid_attributes, :format => :json
      response.status.should be(201)
    end

    it "returns the JSon user" do
      post tournaments_path, :tournament => valid_attributes, :format => :json
      response.body.should have_json_path("id")
    end

    it "creates model OK" do
      post tournaments_path, :tournament => valid_attributes, :format => :json
      @tournament = Tournament.find(:first)
      
    end
    

  end

end
