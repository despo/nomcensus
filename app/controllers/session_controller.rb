class SessionController < ApplicationController

  def destroy
    logout!
    redirect_to root_path
  end

  def create
    person = Person.find_by_token!(params[:token])
    login(person.email)
    redirect_to root_path
  rescue Exception => e
    redirect_to new_access_path, notice: "Invalid token"
  end
end
