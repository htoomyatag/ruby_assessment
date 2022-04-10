class Rating < ActiveRecord::Base
    
    validates :rate, :inclusion => { :in => 1..5 }

	belongs_to :post


end