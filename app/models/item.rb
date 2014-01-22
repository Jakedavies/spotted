class Item < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
	attr_accessible :post, :tag
	attr_reader :date
end