class VenueMailer < ApplicationMailer
  def send_token(email, token)
    @token = token
    mail(to: email, subject: 'Venue account confirmation')
  end

  def send_reservation_confirmation(reservation)
    @reservation = reservation
    mail(to: reservation.user.try(:email), subject: 'Reservation confirmation')
  end

  def send_venue_reservation(reservation)
    @reservation = reservation
    mail(to: reservation.venue.try(:email), subject: 'Reservation confirmation')
  end
end
