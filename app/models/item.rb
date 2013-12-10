class Item < ActiveRecord::Base
	attr_accessible :post, :tag
	attr_reader :date
end