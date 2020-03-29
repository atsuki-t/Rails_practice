class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
