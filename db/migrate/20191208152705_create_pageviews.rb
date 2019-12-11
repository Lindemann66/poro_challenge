class CreatePageviews < ActiveRecord::Migration[5.2]
  def change
    create_table :pageviews do |t|
      t.bigint :visit_id
      t.string :title
      t.string :position
      t.text   :url
      t.string :time_spent
      t.decimal :timestamp, precision: 14, scale: 3
    end

    add_index "pageviews", ["title", "time_spent", "timestamp"], :name => "index_for_pages_uniqueness"
  end
end
