class Person < ActiveRecord::Base
  validates :email, presence: true
  has_many :votes
  has_many :invitations

  def to_s
    self.name || self.email
  end
end
