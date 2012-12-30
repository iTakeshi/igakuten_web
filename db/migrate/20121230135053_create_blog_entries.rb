class CreateBlogEntries < ActiveRecord::Migration
  def change
    create_table :blog_entries do |t|
      t.string :title, null: false
      t.text :unsafe_html, null: false
      t.integer :blog_author_id, null: false

      t.timestamps
    end
  end
end
