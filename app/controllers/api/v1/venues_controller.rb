class Api::V1::VenuesController < Api::V1::BaseController
  before_action :authenticate_rest, only: %i[add_shift add_table] #TODO: add reservation method here too

  def create
    venue = Venue.new(optimized_params(:venue))
    if venue.save
      render json: { success: true, status: 200, message: 'Venue created successfully' }
    else
      json_error_response('Failed to create Venue', venue.errors.full_messages)
    end
  end

  def add_shift
    shift = @venue.shifts.build(optimized_params(:shift))
    if shift.save
      render json: { success: true, status: 200, message: 'Shift created successfully' }
    else
      json_error_response('Failed to create Shift', shift.errors.full_messages)
    end
  end

  def add_table
    table = @venue.tables.build(optimized_params(:table))
    if table.save
      render json: { success: true, status: 200, message: 'Table created successfully' }
    else
      json_error_response('Failed to create Table', table.errors.full_messages)
    end
  end

  # def reservations
  #   #TODO: create this method
  # end

  private

  def authenticate_rest
    @venue = Venue.find_by(token: request.headers['RestToken'])
    json_error_response('Venue is not authorized', {}, 401) unless @venue
  end

  def optimized_params(type)
    params.require(type).permit(*self.send("params_of(#{type})"))
  end

  def params_of(type)
    case type.to_sym
    when :venue
      %i[name email phone_number]
    when :shift
      %i[name start_time end_time]
    when :table
      %i[name min_guest max_guest]
    else
      nil
  end
end
