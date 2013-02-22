class HomeController < ApplicationController
  def index
    person = OpenStruct.new
    person.name    = "John Smith"
    person.age     = 70
    person.pension = 300
    respond_to do |format|
      format.json {render :json => @person} 
    end
  end
end
