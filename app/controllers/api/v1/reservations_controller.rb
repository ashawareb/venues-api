class Api::V1::ReservationsController < Api::V1::BaseController
  before_action :authenticate_user,  only: [:create]
  before_action :authenticate_rest,  only: [:show]

  def create
    @venue = Venue.by_reservation(reservation_params[:table_id], reservation_params[:shift_id])
    @reservation = venue&.reservations.build(reservation_params.merge(user_id: current_user.id))
    if @reservation.save
      render json: @reservation, serializer: ReservationSerializer, status: 200
    else
      json_error_response('Failed to create reservation', @reservation.errors.messages, 422)
    end
  end

  def update
    @reservation = current_user&.reservations&.find(params[:id])
    if @reservation.update(reservation_params)
      render json: @reservation, serializer: ReservationSerializer, status: 200
    else
      json_error_response('Failed to update reservation', @reservation.errors.messages, 422)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :guest_count, :table_id, :shift_id)
  end
end
