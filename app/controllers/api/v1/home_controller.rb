class Api::V1::HomeController < ApplicationController
  # returns count of total employees and managers
  def count
    manager_count = Manager.all.count
    employee_count = Employee.all.count

    render json: { manager: manager_count, employee: employee_count }, status: :ok
  end
end
