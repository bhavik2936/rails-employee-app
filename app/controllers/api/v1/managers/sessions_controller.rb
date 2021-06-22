class Api::V1::Managers::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_to_on_destroy
    log_out_success && return if current_api_v1_manager

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out! Nice to have some break!" }, status: :ok
  end

  def log_out_failure
    render json: { message: "Manager, Couldn't log you out!"}, status: :bad_request
  end
end
