class CreateHackerinos < ActiveRecord::Migration
  def change
    create_table :hackerinos do |t|
      t.string :author
      t.integer :vote
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
