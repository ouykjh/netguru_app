require 'spec_helper'

feature 'User checks subject lists' do
  let!(:student_1) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:student_2) { create :student, first_name: 'Adam', last_name: 'Kowalski' }
  let!(:payment_1) { create :payment, student: student_1, amount: 900.01, paid_date: '2015-10-10' }
  let!(:payment_2) { create :payment, student: student_2, amount: 1000.56, paid_date: '2015-9-10' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Adam'
    expect(page).to have_content '900.01'
    expect(page).to have_content '1000.56'
  end

# FIXME: resolve jQuery problem
  xscenario 'filter by name' do
    fill_in find_field(type: 'search'), with: 'Adam'

    expect(page).not_to have_content 'Jan'
    expect(page).to have_content 'Adam'
  end

  xscenario 'filter by month' do
    fill_in find_field(type: 'search'), with: 'October'

    expect(page).not_to have_content 'Jan'
    expect(page).to have_content 'Adam'
  end
end