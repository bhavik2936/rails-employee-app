class Api::V1::Managers::PasswordsController < Devise::PasswordsController
  respond_to :json
end
