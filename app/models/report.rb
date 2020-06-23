class Report < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes
  has_one_attached :photo

  validates :title, :description, :location, presence: true
  validates :title, length: { maximun: 30 }

  enum status: [:pending, :resolved, :rejected]
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?
end
