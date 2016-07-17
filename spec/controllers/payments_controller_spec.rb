require 'rails_helper'

RSpec.describe PaymentsController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #payments' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end
end