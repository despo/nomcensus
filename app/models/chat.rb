class Chat < ActiveRecord::Base
  before_save :set_slug
  has_and_belongs_to_many :places
  has_many :invitations
  belongs_to :person
  has_many :votes

  validate :name, :time, :date, presence: true

  accepts_nested_attributes_for :person

  def to_param
    slug
  end

  def ordered_places
    self.votes.group(:place_id).select("id, place_id, COUNT(*) as count").map(&:place)
  end

  def votes_for_place(place)
    self.votes.where(place: place).count
  end

  private

  def set_slug
    self.slug = self.name.parameterize
  end
end
