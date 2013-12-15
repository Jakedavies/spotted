class WelcomeController < ApplicationController
  def index
    @latest_post = Item.last
  end
end
