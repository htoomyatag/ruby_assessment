require 'rails_helper'
describe "get all countries route", :type => :request do
  let!(:countries) {FactoryBot.create_list(:random_countries, 20)}
before {get '/api/v1/countries'}
it 'returns all countries' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
