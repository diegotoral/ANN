require 'rails_helper'

RSpec.describe Note, type: :model do
  it_behaves_like 'a presentable'

  describe 'associations' do
    it { is_expected.to belong_to :notebook }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end
end
