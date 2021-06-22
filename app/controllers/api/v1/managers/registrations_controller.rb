class Api::V1::Managers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      render json: { message: "Signed up sucessfully! Please confirm your email to proceed further!" }, status: :created
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: { message: resource.errors.full_messages.first }, status: :bad_request
    end
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      render json: { message: "Profile updated successfully!" }, status: :ok
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: { message: resource.errors.full_messages.first }, status: :bad_request
    end
  end
end
