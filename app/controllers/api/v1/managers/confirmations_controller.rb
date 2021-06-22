class Api::V1::Managers::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      render json: { message: "Generated new confirmation instruction! You better check your mail!" }, status: :created
    else
      render json: { message: resource.errors.full_messages.first }, status: :bad_request
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: { message: "You got confirmation! Try to login now!" }, status: :ok
    else
      render json: { message: "Unable to get you a confirmation!" }, status: :unprocessable_entity
    end
  end
end
