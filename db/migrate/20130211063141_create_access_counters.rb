class CreateAccessCounters < ActiveRecord::Migration
  def change
    create_table :access_counters do |t|
      t.string :page_name, null: false
      t.integer :counter, null: false

      t.timestamps
    end

    add_index :access_counters, :page_name, unique: true
  end
end
