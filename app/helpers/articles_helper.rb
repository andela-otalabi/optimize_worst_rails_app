module ArticlesHelper
   def update_articles_cache
    expire_fragment("articles")
  end
end
