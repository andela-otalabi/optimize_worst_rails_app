module AuthorHelper
  def cache_key_for_authors
    count          = Author.count
    article_count = Article.count
    max_updated_at = Author.maximum(:updated_at).try(:utc).try(:to_s, :number)
    updated_at = Article.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "authors/all-#{count}-#{max_updated_at}-#{article_count}-#{updated_at}"
  end

end