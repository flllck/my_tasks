require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:projects) { create_list(:project, 10) }

  describe 'GET /projects' do
    before { get '/projects' }

    it 'returns list of projects' do
      expect(json).to_not be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
