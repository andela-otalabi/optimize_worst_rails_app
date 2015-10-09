class AuthorSweeper < ActionController::Caching::Sweeper
  observe Author, Article

   def after_save(record)
    expire_page(authors_path)
  end
end