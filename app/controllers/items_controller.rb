class ItemsController < ApplicationController
	helper_method :format_timesince
	def show
		id = params[:id]
		@item = Item.find(id)
	end
	def index
		@filter_message= params[:search]
		@items = Item.all
		if params[:search]!=nil&&params[:search]!=""
			@items = Item.order('created_at DESC').find_all_by_tag(params[:search])

		else
			@items = Item.order('created_at DESC')
		end
	end

	def create
    	@item = Item.create!(params[:item])
    	flash[:notice] = "Post Created"
    	redirect_to items_path

  	end
	def destroy(id = params[:id])
		@item = Item.find(id)
		@item.destroy
		redirect_to items_path
	end

	def format_timesince(time)

		difference = (Time.zone.now- time)
		if difference<120
			return "about a minute ago"
		elsif difference<3600
			return (difference/60).to_i.to_s + " minutes ago"
		elsif difference<86400
			return (difference/3600).to_i.to_s + " hours ago"
		else
			return (difference/86400).to_i.to_s + " days ago"
		end
	end
end
