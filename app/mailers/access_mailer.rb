class AccessMailer < ActionMailer::Base
  default from: "despo.pentara@gmail.com"

  def access_request(email, person)
    @email = email
    @person = person

    @person.reset_token
    @person.save

    mail(to: email, subject: "Access chatandlun.ch")
  end
end
