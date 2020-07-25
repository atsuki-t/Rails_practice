require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(user_name: "ユーザーネーム", email: "abcde@email.com")
  it 'user_name がそのまま帰ること' do
    expect(user.user_name).to eq "ユーザーネーム"
  end
  it 'email がそのまま帰ること' do
    expect(user.email).to eq "abcde@email.com"
  end
end
