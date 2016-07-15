require 'spec_helper'

feature 'User checks subject lists' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak', birthdate: '2010-12-01' }
  let!(:teacher) { create :teacher, first_name: 'Pies', last_name: 'Pluto', academic_title: 'Dr.' }
  let!(:subject_item) { create :subject_item, title: 'Math', teacher: teacher }
  let!(:participant) { create :participation, student: student, subject_item: subject_item }
  let!(:subject_item_note) { create :subject_item_note, subject_item: subject_item, student: student }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit report_subjects_path
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Subjects'
    end

    expect(page).to have_content 'list of subjects'
    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Nowak'
    expect(page).to have_content '2010-12_01'
    expect(page).to have_content 'Math'
    expect(page).to have_content '(Pies Pluto)'
  end
end