require 'jwt'

class Venue < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  VALID_PHONE_NUMBER = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i.freeze

  has_many :reservations
  has_many :shifts
  has_many :tables

  validates :name, presence: true, length: { minimum: 3, maximum: 150 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER }

  before_save { self.email = email.downcase }
  before_save :create_token
  #after_save :send_token

  scope :by_reservation, -> (table_id, shift_id) { includes(:tables, :shifts).find_by(tables: { id: table_id }, shifts: { id: shift_id }) }

  private

  def create_token
    self.token = JWT.encode self, nil, false
  end

  # def send_token
  #   RestaurantMailer.send_token(self.email, self.token).deliver_now
  # end
end
