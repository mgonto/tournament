require "spec_helper"

describe RegistrationsController do
  describe "routing" do

    it "routes to #create" do
      post("users").should route_to("registrations#create")
    end

    it "routes to #destroy" do
      pending "until we know how to configure this in devise"
      delete("users/2").should route_to("users#destroy", :id => "2")
    end

  end
end
