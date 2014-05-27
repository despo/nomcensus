class InvitationMailer < ActionMailer::Base
  default from: "Despo at nomcensus.com <despo@nomcensus.com>"

  def to_chat(invitation, chat)
    @invitation = invitation
    @chat = chat

    mail(to: @invitation.person.email, subject: @chat.name)
  end
end
