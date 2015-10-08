class AuthorSweeper < ActionController::Caching::Sweeper
  observe Author, Article

   def after_save(record)
    expire_page(authors_path)
    expire_page("/#{record.url}")
  end
end