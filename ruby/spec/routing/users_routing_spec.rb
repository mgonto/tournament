require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #create" do
      post("users").should route_to("users#create")
    end

    it "routes to #destroy" do
      delete("users/2").should route_to("users#destroy", :id => "2")
    end

    it "routes to #login" do
      post("users/login").should route_to("users#login")
    end

  end
end
