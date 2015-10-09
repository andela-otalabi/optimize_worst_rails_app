class AuthorSweeper < ActionController::Caching::Sweeper
  observe Author

  def after_save(author)
    expire_cache_for(author)
  end

  def after_destroy(author)
    expire_cache_for(author)
  end

  private
  def expire_cache_for(author)
    expire_fragment(:controller => '#{record}', 
      :action => 'index', :action_suffix => 'author')
  end
end