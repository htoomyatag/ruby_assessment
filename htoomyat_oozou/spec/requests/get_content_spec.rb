require 'rails_helper'
describe "get all contents route", :type => :request do


   let!(:contents) {FactoryBot.create_list(:random_content, 20)}
    before {get '/api/v1/published_contents'}
    it 'returns all contents' do
        expect(JSON.parse(response.body).size).to eq(20)
      end
    it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end