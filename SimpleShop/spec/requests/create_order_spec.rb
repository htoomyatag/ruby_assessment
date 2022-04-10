require 'rails_helper'
describe "post a order route", :type => :request do


before do
    post '/api/v1/orders', 
    params: {api_v1_order: { 
        :first_name => 'frst_name', 
        :last_name => 'last_name', 
        :shipping_address => 'test_address', 
        :order_total => 500.50, 
        :paid_at => '2022-02-17T00:00:00.000Z',
        :payment_status => 'Paid' 
    }}

  end


it 'returns the first_name' do
    expect(JSON.parse(response.body)['first_name']).to eq('frst_name')
end
it 'returns the last_name' do
    expect(JSON.parse(response.body)['last_name']).to eq('last_name')
  end
it 'returns the shipping_address' do
    expect(JSON.parse(response.body)['shipping_address']).to eq('test_address')
  end
it 'returns the order_total' do
    expect(JSON.parse(response.body)['order_total']) == (500.50)
  end
it 'returns the paid_at' do
    expect(JSON.parse(response.body)['paid_at']).to eq('2022-02-17T00:00:00.000Z')
  end
it 'returns the payment_status' do
    expect(JSON.parse(response.body)['payment_status']).to eq('Paid')
  end
it 'returns a created status' do
    expect(response).to have_http_status(200)
  end

end

