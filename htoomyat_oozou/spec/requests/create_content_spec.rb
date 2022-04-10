require 'rails_helper'
describe "create content", :type => :request do


before do
    post '/api/v1/create_contents', 
    params: {content: { 
        :title => 'test_title', 
        :published_date => '2022-02-17T00:00:00.000Z', 
        :author => 'test_author', 
        :summary => 'test_summary', 
        :content => 'test_content',
        :status => 'published' 
    }}

  end



 it 'returns a created status' do
    expect(response).to have_http_status(200)
  end

end

