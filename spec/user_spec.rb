require 'spec_helper.rb'

describe User do
  it "#can_follow? unless self" do
    user = build(:user)
    user.can_follow?(user).should eq(false)
  end

  it "#can_follow? unless already following" do
    user = create(:user)
    followed_user = create(:user)
    user.followed_users << followed_user
    user.can_follow?(followed_user).should eq(false)
  end

  it "#can_follow? other users" do
    user = create(:user)
    other_user = create(:user)
    user.can_follow?(other_user).should eq(true)
  end

end
