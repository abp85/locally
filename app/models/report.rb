class Report < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes
  has_one_attached :photo

  validates :title, :description, :location, presence: true
  validates :title, length: { maximum: 30 }

  enum status: [:pending, :resolved, :rejected]
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  def total_votes
    votes = Vote.all
    report_votes = votes.keep_if { |vote| vote.report_id == self.id }
    votes_count = 0
    report_votes.each do |vote|
      if vote.value == "up"
        votes_count += 1
      elsif vote.value == "down"
        votes_count -= 1
      end
      return votes_count
    end
  end

end
