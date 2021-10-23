class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user, only: %i[current update authenticate]

  def authenticat
    render json: { success, status: 200, message: "Welcom #{current_user.username}, Login successfully"}
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: { success: true, status: 200, message: 'User created successfully'}
    else
      json_error_response('Failed to create user', user.errors.full_messages)
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: { status: success, message: 'User updated successfully', user: user}
    else
      json_error_response('Updated failed', user.errors.full_messages)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
