class AccessController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    person = Person.find_by_email!(params[:person][:email])
    AccessMailer.access_request(email, person).deliver

    redirect_to root_path, notice: "Check your inbox for an access link"
  rescue Exception => e
    redirect_to :back
  end
end
