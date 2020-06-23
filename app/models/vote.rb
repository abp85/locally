class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :report
  validates :user, uniqueness: { scope: :report }

  enum value: [:up, :center, :down]
end
