class Api::V1::ManagersController < ApplicationController
  before_action :authenticate_api_v1_manager!

  # plain endpoint for authentication check
  def authenticate
  end

  # returns current manager's json
  def show
    render json: current_api_v1_manager, status: :ok
  end
end
