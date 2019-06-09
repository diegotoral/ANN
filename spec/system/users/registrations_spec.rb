require 'rails_helper'

RSpec.feature 'User Registrations', type: :system do
  scenario 'Successful registration' do
    visit root_path

    within 'form#new_user' do
      fill_in 'Email', with: 'jon@got.com'
      fill_in 'Password', with: 'abc1234'
      fill_in 'Password confirmation', with: 'abc1234'

      click_on 'Sign Up'
    end

    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end

  scenario 'Unsuccessful registration' do
    visit root_path

    within 'form#new_user' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'abc'
      fill_in 'Password confirmation', with: '123'

      click_on 'Sign Up'
    end

    expect(page).to have_content 'Email can\'t be blank'
  end
end
