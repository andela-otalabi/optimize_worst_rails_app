class AddDefaultValueToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :upvotes, :integer, default: 0
  end
end
