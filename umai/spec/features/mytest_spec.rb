require 'httparty'


describe "create post", :type => :request do


   before do
   

    @response = HTTParty.post 'http://127.0.0.1:9292/posts', 
    body: {post: { 
        :title => 'this title', 
        :user_id => '1', 
        :content => 'this is my content', 
        :author_ip => '127.0.0.1'
    }}


  end

    it 'is true' do
         expect(JSON.parse(@response.body)) == (200)
    end




end

