class RemoveAvatarFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_attachment :users, :avatar
  end
end
