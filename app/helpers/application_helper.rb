module ApplicationHelper
  def votes_for(place)
    votes = @chat.votes_for_place(place)
    "(#{votes})" if votes
  end
end
