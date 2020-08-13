# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_content_type    :string(255)
#  avatar_file_name       :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  introduction           :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  user_name              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :favorites
  has_many :favorite_tweets, through: :favorites, source: :tweet

  validates :user_name, presence: true
  validates :email, presence: true

  # 画像ファイルのサイズ指定、デフォルトでは /missing.png を使用
  has_attached_file :avatar, system: { medium: '300x300>', thumb: '100x100>' }, default_url: '/initial_image.jpg'

  validates_attachment_content_type :avatar, content_type: %r{¥Aimage¥/.*¥z}
end
