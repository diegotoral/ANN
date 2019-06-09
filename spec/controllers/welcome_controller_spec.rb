require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#index' do
    it 'responds with success' do
      get :index

      expect(response).to be_successful
    end
  end
end
