class ChatsPlaces < ActiveRecord::Base
  belongs_to :chat
  belongs_to :place
end
