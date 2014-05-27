class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(email)
    session[:person_email] = email
  end

  def current_user
    if session.has_key?(:person_email)
      email = session[:person_email]
      @current_user ||= Person.find_by_email(email)
    end
  rescue ActiveRecord::RecordNotFound
    session[:person_email] = nil
  end

  def logout!
    @current_user = nil
    reset_session
  end

  def email
    current_user.try(:email)
  end

  def logged_in?
    current_user.present?
  end

  def can_access_chat?(chat)
    logged_in? and current_user.invitations.exists?(chat: chat.id)
  end

  helper_method :email, :logged_in?, :can_access_chat?
end
