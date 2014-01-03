class ItemsController < ApplicationController
  helper_method :format_timesince
  helper_method :can_delete, :sort_column, :sort_direction
  def show
    id = params[:id]
    @item = Item.find(id)
  end
  def index


    @filter_message= params[:search]
    if params[:search]!=nil&&params[:search]!=""
      #@items = Item.order('created_at DESC').paginate(:page => params[:page])
      @items = Item.order(params[:sort] + ' ' + params[:direction]).paginate(:page => params[:page])
    else
      #@items = Item.order('created_at DESC').paginate(:page => params[:page])
      @items = Item.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page])
    end
  end

  def create
    params[:item][:user] = session[:user_id]
    @item = Item.create!(params[:item])
    flash[:notice] = "Post Created"
    redirect_to items_path
  end
  def destroy(id = params[:id])
    @item = Item.find(id)
    @item.destroy
    redirect_to items_path
  end

  #this is a helper method to format the time since post creation
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

  #this is a helper method to determine if the post can be deleted
  def can_delete(time, user)

    difference = (Time.zone.now- time)
    if difference<3660 && user==session[:user_id]
      return true
    else
      return false
    end
  end
  def vote
    @user = User.find(session[:user_id])
    @post = Item.find(params[:id])
    @post.liked_by @user
    redirect_to items_path
  end
  def unvote
    @user = User.find(session[:user_id])
    @post = Item.find(params[:id])
    @post.unliked_by @user
    redirect_to items_path
  end
def sort_column
    if params[:sort] != nil && params[:sort] != session[:sort]
      session[:sort] = params[:sort]
    end
    session[:sort] || "created_at"
  end
  
  def sort_direction
    if params[:direction] != nil && params[:direction] != session[:direction]
      session[:direction] = params[:direction]
    end
    return session[:direction] || "asc"
  end

end
