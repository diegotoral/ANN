class Api::V1::BaseController < ActionController::API
  self.responder = ApplicationResponder

  respond_to :json
end
