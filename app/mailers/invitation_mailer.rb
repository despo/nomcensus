class InvitationMailer < ActionMailer::Base
  default from: "despo.pentara@gmail.com"

  def to_chat(invitation, chat)
    @invitation = invitation
    @chat = chat
    puts "up to here"

    mail(to: @invitation.person.email, subject: @chat.name)
  end

  def access_email(email)
    @email = email

    mail(to: email, subject: "Access to chatandlun.ch")
  end

end
