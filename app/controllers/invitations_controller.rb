class InvitationsController < ApplicationController

  def index
    @invitations = current_user.invitations
  end

  def new
    @person = Person.new
  end

  def create
    @chat = Chat.find_by_slug(params[:chat_id])

    emails = params[:person][:email].split(",").map(&:strip)
    emails.each do |email|
      invitee = Person.where(email: email).first_or_create
      invitation = Invitation.new(chat: @chat, person: invitee)

      if invitation.save
        InvitationMailer.to_chat(invitation, @chat).deliver
      end
    end
    redirect_to @chat
  end
end
