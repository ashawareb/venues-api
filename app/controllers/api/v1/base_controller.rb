class Api::V1::BaseController < ApplicationController
  include Knock::Authenticable

  def json_error_response(message, errors, status = :unauthorized)
    errors_obj = { message: message }.merge(details: errors)
    render json: { success: false, message: message, errors: errors_obj }, status: status
  end
end
