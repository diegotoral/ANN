# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it_behaves_like 'a presentable'

  describe 'associations' do
    it { is_expected.to have_many(:notebooks).dependent(:destroy) }
  end
end
