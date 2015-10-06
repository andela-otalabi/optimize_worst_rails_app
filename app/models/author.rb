class Author < ActiveRecord::Base
  has_many :articles 

  def self.generate_authors(count=1000)
    count.times do
      Fabricate(:author)
    end
    first.articles << Article.create(name: "some commenter", body: "some body")
  end

  scope :most_prolific_writer, -> { order('articles_count desc').first }

  scope :with_most_upvoted_article, -> { joins(:articles).order('articles.upvotes desc').first.name }

end