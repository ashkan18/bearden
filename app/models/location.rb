class Location < ApplicationRecord
  belongs_to :organization

  validates :city, length: { maximum: 256 }
  validates :content, presence: true, length: { maximum: 256 }
  validates :country, length: { maximum: 256 }

  include Rankable
  include Auditable

  def geocoded?
    latitude.present? && longitude.present?
  end

  def geocodable?
    content? && !geocoded?
  end
end
