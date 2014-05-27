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
        InvitationMailer.to_chat(invitation, @chat, current_user.email).deliver
      end
    end
    redirect_to @chat
  end

  def accept
    @chat = Chat.find_by_slug(params[:chat_id])
    @invitation = current_user.invitations.where(chat: @chat).first
    @invitation.update_attribute(:accepted, true)

    redirect_to @chat
  end

  def reject
    @chat = Chat.find_by_slug(params[:chat_id])
    @invitation = current_user.invitations.where(chat: @chat).first
    @invitation.update_attribute(:accepted, false)

    redirect_to @chat
  end
end
