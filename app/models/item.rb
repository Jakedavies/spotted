class Item < ActiveRecord::Base
	attr_accessible :post, :tag, :user
	attr_reader :date
end