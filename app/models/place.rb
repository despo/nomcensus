class Place < ActiveRecord::Base
  has_and_belongs_to_many :chats
  has_many :votes

  validates :name, presence: true

  def votes_for_chat(chat)
    votes.where(chat: chat)
  end
end
