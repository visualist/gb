require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "nil guest still returns valid string" do
    bad = Post.where('title' => 'Bad').first
    assert_not_nil bad
    assert bad.author, 'unknown'
  end

  test "byusername scopes results" do
    expected_count = 3
    for_user = 'wade'
    posts = Post.byusername(for_user)
    assert_equal expected_count, posts.size, "should be #{expected_count} entries for user #{for_user}"
  end
end
