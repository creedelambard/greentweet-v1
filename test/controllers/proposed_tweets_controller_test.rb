require 'test_helper'

class ProposedTweetsControllerTest < ActionController::TestCase
  setup do
    @proposed_tweet = proposed_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposed_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposed_tweet" do
    assert_difference('ProposedTweet.count') do
      post :create, proposed_tweet: { description: @proposed_tweet.description, hashtags: @proposed_tweet.hashtags, user_id: @proposed_tweet.user_id }
    end

    assert_redirected_to proposed_tweet_path(assigns(:proposed_tweet))
  end

  test "should show proposed_tweet" do
    get :show, id: @proposed_tweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposed_tweet
    assert_response :success
  end

  test "should update proposed_tweet" do
    patch :update, id: @proposed_tweet, proposed_tweet: { description: @proposed_tweet.description, hashtags: @proposed_tweet.hashtags, user_id: @proposed_tweet.user_id }
    assert_redirected_to proposed_tweet_path(assigns(:proposed_tweet))
  end

  test "should destroy proposed_tweet" do
    assert_difference('ProposedTweet.count', -1) do
      delete :destroy, id: @proposed_tweet
    end

    assert_redirected_to proposed_tweets_path
  end
end
