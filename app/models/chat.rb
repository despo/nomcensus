class Chat < ActiveRecord::Base
  before_save :set_slug

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = self.name.parameterize
  end
end
