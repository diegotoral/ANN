require 'rails_helper'

RSpec.describe Notebook, type: :model do
  it_behaves_like 'a presentable'

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many(:notes).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
