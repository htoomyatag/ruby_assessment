require 'rails_helper'
describe "get all orders route", :type => :request do
  let!(:orders) {FactoryBot.create_list(:random_orders, 20)}
before {get '/api/v1/orders'}
it 'returns all orders' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end


