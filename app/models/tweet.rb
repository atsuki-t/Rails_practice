# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  has_many :comments, dependent: :destroy, inverse_of: :tweet
end
