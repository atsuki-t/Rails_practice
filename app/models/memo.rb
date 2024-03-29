# == Schema Information
#
# Table name: memos
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Memo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
