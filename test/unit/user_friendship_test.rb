require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an expection" do
  	assert_nothing_raised do
  		UserFriendship.create user: users(:albertomignani), friend: users(:cgcesare)
  	end
  end

  test "that creating a friendship based on user id and friend id works" do
  	UserFriendship.create user_id: users(:albertomignani).id, friend_id: users(:cgcesare).id
  	assert users(:albertomignani).friends.include?(users(:cgcesare))
  end
end
