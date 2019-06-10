# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationPresenter, type: :presenter do
  DummyPresenter = Class.new(described_class) do
    def name
      "You know nothing, #{model.name}!"
    end
  end

  it 'delegates any missing method to the model' do
    model = double(:model, name: 'Jon Snow')
    presenter = DummyPresenter.new model

    expect(presenter.name).to eq('Jon Snow')
  end

  it 'calls methods defined on the presenter itself' do
    model = double(:model, name: 'Jon Snow')
    presenter = DummyPresenter.new model

    expect(presenter.name).to eq('You know nothing, Jon Snow!')
  end

  describe '#present' do
    it 'returns itself' do
      presenter = DummyPresenter.new Object.new

      expect(presenter.present).to eq presenter
    end
  end
end
