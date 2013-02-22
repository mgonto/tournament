require "spec_helper"

describe V1::UsersController do
  describe "routing" do

    it "routes to #create" do
      post("v1/users").should route_to("v1/users#create")
    end

    it "routes to #destroy" do
      delete("v1/users/2").should route_to("v1/users#destroy", :id => "2")
    end

    it "routes to #login" do
      post("v1/users/login").should route_to("v1/users#login")
    end

  end
end
