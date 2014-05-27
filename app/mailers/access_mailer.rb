class AccessMailer < ActionMailer::Base
  default from: "despo@nomcensus.com"

  def access_request(email, person)
    @email = email
    @person = person

    @person.reset_token
    @person.save

    mail(to: email, subject: "Access nomcensus.com")
  end
end
