class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_api_v1_manager!

  def index
    @employee = Employee.where(manager_id: current_api_v1_manager.id)
    render json: @employee, status: :ok
  end

  def create
    @employee = @manager.employees.build(employee_params)

    if @employee.save
      render json: { message: "Employee created" }, status: :created
    else
      render json: { message: "Coulnd't create employee" }, status: :not_acceptable
    end
  end

  def show
    @employee = Employee.find_by(manager_id: current_api_v1_manager.id, id: params[:id])
    render json: @employee, status: :ok
  end

  def update
    @employee = Employee.find_by(manager_id: current_api_v1_manager.id, id: params[:id])

    if @employee && @employee.update(employee_params)
      render json: { message: "Employee updated" }, status: :ok
    else
      render json: { message: "Couldn't find or update employee" }, status: :bad_request
    end
  end

  def destroy
    @employee = Employee.find_by(manager_id: current_api_v1_manager.id, id: params[:id])

    if @employee && @employee.destroy
      render json: { message: "Employee removed" }, status: :ok
    else
      render json: { message: "Couldn't find or remove employee" }, status: :bad_request
    end
  end

  private

  def employee_params
    params.require(:api_v1_employee).permit(:name, :experience, :salary)
  end
end
