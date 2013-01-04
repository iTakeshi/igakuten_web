class AddUniqueIndexToBlogEntriesOnTitle < ActiveRecord::Migration
  def change
    add_index :blog_entries, :title, unique: true
  end
end
