class SessionController < ApplicationController
  def logout
    logout!
    redirect_to root_path
  end

  def new
    @person = Person.new
  end

  def create
    login(params[:person_email] )

    redirect_to root_path
  end

  def request_access
    InvitationMailer.access_email(params[:person_email])
  end
end
