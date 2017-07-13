class Blog < ApplicationRecord
  has_many :posts

  before_validation :sanitize_subdomain
  validates :subdomain, 
    exclusion: { in: %w(www secure staging admin), message:  "%{value} is reserved."},
    presence: true,
    uniqueness: true

  private

  def sanitize_subdomain
    self.subdomain = self.subdomain.parameterize
  end

end
