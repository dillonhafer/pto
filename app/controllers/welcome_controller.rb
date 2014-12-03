class WelcomeController < ApplicationController
  def index
    @people = Person.order(:name)    
  end

  def details
    @person = Person.find(params[:id])
    render layout: false
  end
end
