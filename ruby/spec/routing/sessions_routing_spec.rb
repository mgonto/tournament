require "spec_helper"

describe RegistrationsController do
  describe "routing login" do

    it "routes to #create" do
      post("/users/sign_in").should route_to("sessions#create")
    end

  end
end
