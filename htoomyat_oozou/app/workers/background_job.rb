class BackgroundJob
  include Sidekiq::Worker
  include Sidekiq::Job


  def perform
       Content.where(:published_date => Date.today).update_all(status: 'published')
  end

 

end
