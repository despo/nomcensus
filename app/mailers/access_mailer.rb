class AccessMailer < ActionMailer::Base
  default from: "Despo at nomcensus.com <despo@nomcensus.com>"

  def access_request(person)
    @person = person

    @person.reset_token
    @person.save

    mail(to: @person.email, subject: "Access nomcensus.com")
  end
end
