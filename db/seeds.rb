# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  user_name: "admin",
  email: "admin@example.com",
  introduction: "admin user です。",
  password: "password"
)
User.create!(
  user_name: "user1",
  email: "user1@example.com",
  introduction: "user1 です。",
  password: "password"
)
User.create!(
  user_name: "user2",
  email: "user2@example.com",
  introduction: "user2 です。",
  password: "password"
)

Role.create!(name: 'admin')
Role.create!(name: 'manager')
Role.create!(name: 'read_only')

UserRole.create!(user_id: 1, role_id: 1)
UserRole.create!(user_id: 2, role_id: 2)
UserRole.create!(user_id: 3, role_id: 2)

User.all.each do |user|
  user.tweets.create!(
    title: "はじめまして、#{user.user_name} です。",
    body: "よろしくお願いします。"
  )
end
Comment.create!(
  user_id: 2,
  tweet_id: 1,
  content: "よろしくね。"
)
Comment.create!(
  user_id: 3,
  tweet_id: 1,
  content: "よろしくね。"
)
