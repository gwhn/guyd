#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, :article => { }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, :id => articles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => articles(:one).id
    assert_response :success
  end

  test "should update article" do
    put :update, :id => articles(:one).id, :article => { }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, :id => articles(:one).id
    end

    assert_redirected_to articles_path
  end
end
