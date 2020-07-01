class Report < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_location,
    against: [:location],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  belongs_to :category
  has_many :votes
  has_one_attached :photo

  validates :title, :description, :location, presence: true
  validates :title, length: { maximum: 30 }

  enum status: [:pending, :resolved, :rejected]

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def total_votes
    votes_count = 0
    if votes.empty?
      return votes_count
    else
      votes.each do |vote|
        if vote.value == "up"
          votes_count += 1
        elsif vote.value == "down"
          votes_count -= 1
        end
      end
    end

    return votes_count
  end

  def has_upvoted(user)
    vote = votes.find_by(user: user)
    return false unless vote

    return vote.value == "up"
  end

  def has_downvoted(user)
    vote = votes.find_by(user: user)
    return false unless vote

    return vote.value == "down"
  end
end
