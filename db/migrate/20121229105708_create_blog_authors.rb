class CreateBlogAuthors < ActiveRecord::Migration
  def change
    create_table :blog_authors do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :blog_authors, :name, unique: true
  end
end
