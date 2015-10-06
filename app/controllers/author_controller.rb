class AuthorController < ApplicationController

  def index
    @authors = Author.includes(:articles).all.paginate(:page => params[:page])
  end
end
