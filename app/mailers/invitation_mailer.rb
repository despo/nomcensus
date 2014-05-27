class InvitationMailer < ActionMailer::Base
  default from: "Despo at nomcensus.com <despo@nomcensus.com>"

  def to_chat(invitation, chat, reply_to_email)
    @invitation = invitation
    @chat = chat

    mail(reply_to: reply_to_email, to: @invitation.person.email, subject: @chat.name)
  end
end
