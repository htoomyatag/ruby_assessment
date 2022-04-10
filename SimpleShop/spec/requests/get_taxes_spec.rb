require 'rails_helper'
describe "get all taxes route", :type => :request do
  let!(:taxes) {FactoryBot.create_list(:random_taxes, 20)}
before {get '/api/v1/taxes'}
it 'returns all taxes' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
