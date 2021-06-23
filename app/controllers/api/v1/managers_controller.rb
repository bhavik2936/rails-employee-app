class Api::V1::ManagersController < ApplicationController
  before_action :authenticate_api_v1_manager!

  def authenticate
  end

  def show
    render json: current_api_v1_manager, status: :ok
  end
end
