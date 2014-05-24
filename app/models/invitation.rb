class Invitation < ActiveRecord::Base
  belongs_to :chat
  belongs_to :person

  validates_uniqueness_of :person, scope: [ :chat ]

end
