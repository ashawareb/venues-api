class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :venue
  belongs_to :shift
  belongs_to :table

  validates :reservation_uniqueness!, on: create
  validates :table_guest_count
  validates :shift_uniqueness!

  #after_create :send_email

  private

  def reservation_uniqueness!
    if Reservation.where('table_id = ? AND shift_id = ? AND DATE(start_at) = ?', table_id, shift_id, start_at.to_date).present?
      errors.add(:id, 'Has existing reservation')
    end
  end

  def table_guest_count
    unless table.min_guest <= guest_count && table.max_guest >= guest_count
      errors.add(:id, 'Number of guest cannot match table size')
    end
  end

  def shift_uniqueness!
    unless shift.start_at.to_formatted_s(:time) <= start_at.to_formatted_s(:time) &&
           start_at.to_formatted_s(:time) <= shift.end_at.to_formatted_s(:time) &&
           shift.start_at.to_formatted_s(:time) <= end_at.to_formatted_s(:time) &&
           end_at.to_formatted_s(:time) <= shift.end_at.to_formatted_s(:time)
      errors.add(:id, 'Time of reservation is invalid')
    end
  end

  # def send_email
  #   RestaurantMailer.send_user_reserv(self).deliver_now
  #   RestaurantMailer.send_restaurant_reserv(self).deliver_now
  # end
end
