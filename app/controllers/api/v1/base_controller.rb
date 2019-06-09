class Api::V1::BaseController < ActionController::API
  self.responder = ApplicationResponder

  respond_to :json

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: 'Record not found' }, status: :not_found
  end
end
