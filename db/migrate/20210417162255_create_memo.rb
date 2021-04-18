class CreateMemo < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
