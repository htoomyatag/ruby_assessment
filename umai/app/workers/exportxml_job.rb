require 'active_job'
require 'sidekiq' 
require 'sidekiq-scheduler'


class ExportxmlJob
  # include Sidekiq::Worker
  include Sidekiq::Job

  def perform
  
    allfeedbacks = Feedback.includes(:user)
  
    xml_content = Nokogiri::XML::Builder.new { |xml| 
      xml.body do
          allfeedbacks.each do |feedback|
              xml.feedback do
                xml.feedbackID feedback.id
                xml.ownername User.where(:id => feedback.owner_id).pluck(:username).join
                xml.ownercomment feedback.owner_comment
                if feedback.post_id.nil?
                xml.type "user"
                else
                xml.type "post"
                end
              end
          end
      end
    }.to_xml

    puts xml_content
    File.open('feedback.xml', 'wb') {|f| f.write xml_content }



  end

end
