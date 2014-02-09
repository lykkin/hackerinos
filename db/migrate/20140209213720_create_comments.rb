class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :hackerino_id
      t.string :content
      t.string :author

      t.timestamps
    end
    add_index :comments, [:hackerino_id, :created_at]
  end
end
