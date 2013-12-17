class Item < ActiveRecord::Base
  acts_as_votable
	attr_accessible :post, :tag, :user
	attr_reader :date
end