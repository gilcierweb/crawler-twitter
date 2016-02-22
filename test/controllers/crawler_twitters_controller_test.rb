require 'test_helper'

class CrawlerTwittersControllerTest < ActionController::TestCase
  setup do
    @crawler_twitter = crawler_twitters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crawler_twitters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crawler_twitter" do
    assert_difference('CrawlerTwitter.count') do
      post :create, crawler_twitter: { content: @crawler_twitter.content, publish: @crawler_twitter.publish, tags: @crawler_twitter.tags, user: @crawler_twitter.user }
    end

    assert_redirected_to crawler_twitter_path(assigns(:crawler_twitter))
  end

  test "should show crawler_twitter" do
    get :show, id: @crawler_twitter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crawler_twitter
    assert_response :success
  end

  test "should update crawler_twitter" do
    patch :update, id: @crawler_twitter, crawler_twitter: { content: @crawler_twitter.content, publish: @crawler_twitter.publish, tags: @crawler_twitter.tags, user: @crawler_twitter.user }
    assert_redirected_to crawler_twitter_path(assigns(:crawler_twitter))
  end

  test "should destroy crawler_twitter" do
    assert_difference('CrawlerTwitter.count', -1) do
      delete :destroy, id: @crawler_twitter
    end

    assert_redirected_to crawler_twitters_path
  end
end
