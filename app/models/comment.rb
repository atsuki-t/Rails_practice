# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tweet, optional: true
  # has_many :tweets

  validates :content, presence: true
end
