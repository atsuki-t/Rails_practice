class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles do |t|
      t.references :user, foreign_key: true, null: false
      t.references :role, foreign_key: true, null: false
      t.timestamps

      t.index %i[user_id role_id], unique: true
    end
  end
end
