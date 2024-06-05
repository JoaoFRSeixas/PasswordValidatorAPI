
class Api::V1::PasswordValidationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def validate
    password = params[:password]
    is_valid = ::PasswordValidatorService.validate(password)
    render json: { valid: is_valid }
  end
end
