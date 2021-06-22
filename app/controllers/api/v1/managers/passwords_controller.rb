class Api::V1::Managers::PasswordsController < Devise::PasswordsController
  respond_to :json

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    render json: { message: "Reset Password link has been sent if email exists" }, status: :created
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      render json: { message: "Password reset successfully! Try signing in!" }, status: :ok
    else
      set_minimum_password_length
      render json: { message: resource.errors.full_messages.first }, status: :bad_request
    end
  end
end
