class AuthorController < ApplicationController
  caches_page :index
  cache_sweeper :author_sweeper

  def index
    @authors = Author.includes(:articles).all.paginate(:page => params[:page])
  end
end
