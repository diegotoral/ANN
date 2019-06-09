require 'rails_helper'

RSpec.describe Api::V1::BaseController, type: :controller do
  let(:user) { create(:user) }

  include Devise::Test::ControllerHelpers

  context 'with an unauthorized request' do
    controller do
      def index
        render json: { success: 'it works' }
      end
    end

    it 'responds with status 401 Unauthorized' do
      get :index, format: :json

      expect(response).to have_http_status 401
    end
  end

  context 'when ActiveRecord::RecordNotFound is raised from an action' do
    controller do
      def index
        raise ActiveRecord::RecordNotFound
      end
    end

    it 'handles the exception gracefuly' do
      sign_in user

      get :index, format: :json

      expect(response).to have_http_status 404
      expect(json[:error]).to eq 'Record not found'
    end
  end
end
