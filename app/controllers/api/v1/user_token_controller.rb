class Api::V1::UserTokenController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
end
