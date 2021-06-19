class Api::V1::Managers::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  def after_confirmation_path_for(resource_name, resource)
    ENV['REACT_APP_URL']
   end
end
