class Item < ActiveRecord::Base
	self.per_page = 5
  acts_as_votable
	attr_accessible :post, :tag, :user
	attr_reader :date
end