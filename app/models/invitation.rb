class Invitation < ActiveRecord::Base
  belongs_to :chat
  belongs_to :person

  validates_uniqueness_of :person, scope: [ :chat ]

  before_save :generate_token

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64(nil, false)
  end

end
