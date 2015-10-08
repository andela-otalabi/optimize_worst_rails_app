class RemoveIndexFromComments < ActiveRecord::Migration
  def change
    remove_index :articles, column: :author_id
    remove_index :comments, column: :article_id
  end
end
