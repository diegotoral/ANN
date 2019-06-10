# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ann::Responders::JsonResponder do
  DummyResponder =  Class.new { include Ann::Responders::JsonResponder }

  subject(:responder) { DummyResponder.new }

  describe '#has_view_rendering?' do
    it 'disables view rendering so it don\'t try to respond in other format' do
      expect(responder.has_view_rendering?).to be_falsy
    end
  end
end
