class DeletePostsColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :description
    remove_column :posts, :status
    remove_column :posts, :published_at
  end
end
