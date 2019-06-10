# frozen_string_literal: true

RSpec.shared_examples 'a presentable' do
  it 'presents itself when requested' do
    expect(subject.present).to be_a ApplicationPresenter
  end
end
