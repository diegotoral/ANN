# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gravatar::Avatar do
  describe '#hash' do
    it 'returns a MD5 representation of the email' do
      email = 'some@email.com'

      avatar = described_class.new email

      expect(avatar.hash).to match(/^[a-f0-9]{32}$/)
    end
  end

  describe '#url' do
    it 'returns the full URL to the avatar' do
      avatar = described_class.new 'some@email.com'

      expect(avatar.url).to match(/^https\:\/\/www\.gravatar\.com\/avatar\/#{avatar.hash}/)
    end
  end
end
