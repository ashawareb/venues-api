class Shift < ApplicationRecord

  belongs_to :venue

  validates :check_time!
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  private

  def check_time!
    errors.add(:id, 'Invalid shift time') if start_at.to_formatted_s(:time) > end_at.to_formatted_s(:time)
  end
end
