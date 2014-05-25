class HomeController < ApplicationController
  def index
    return unless logged_in?

    @invitations = current_user.invitations
    render 'invitations/index'
  end
end
