# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ann::Helpers::FormBuilder do
  let(:template) { Object.new.extend ActionView::Helpers::TagHelper }

  describe '#error_message' do
    it 'returns a paragraph with first error message for the specified attribute' do
      user = build(:user, email: nil)
      builder = described_class.new :user, user, template, {}

      user.validate

      expect(builder.error_message(:email)).to match(/\<p\>Email can&#39;t be blank\<\/p\>/)
    end
  end
end
