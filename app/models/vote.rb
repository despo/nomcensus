class Vote < ActiveRecord::Base
  validates_uniqueness_of :chat, scope: [ :place, :person ]
  belongs_to :chat
  belongs_to :place
  belongs_to :person

end
