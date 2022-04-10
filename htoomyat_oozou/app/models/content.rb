class Content < ApplicationRecord

	after_create :check_date

    private
	  def check_date
	    if self.published_date ==  Date.today or self.published_date < Date.today 
	    	     update_attribute(:status, 'published')
	    elsif self.published_date >  Date.today 
	    	     update_attribute(:status, 'draft')
	    end
	  end


end
