class Person < ActiveRecord::Base
  validates :email, presence: true
  has_many :votes
  has_many :invitations

  def to_s
    self.name || self.email
  end

  def with_privacy(on=true)
    on ? "#{self.email.split("@")[0]}@xxxxx" : self.to_s
  end

  def reset_token
    self.token = SecureRandom.urlsafe_base64(nil, false)
    self.token_time = DateTime.now
  end
end
