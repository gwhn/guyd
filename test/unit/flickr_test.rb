require 'test_helper'

class FlickrTest < ActiveSupport::TestCase
  test "should get user id for username" do
    user = Flickr.find_by_username(Flickr::USERS[0])
    assert_equal user['username'], Flickr::USERS[0]
    assert_not_nil user['nsid']
  end

  test "can get latest 5 favourites from flickr" do
    favourites = Flickr.get_favourites(Flickr::USERS[0])
    favourites.each do |photo|
      assert_not_nil photo['farm']
      assert_not_nil photo['server']
      assert_not_nil photo['id']
      assert_not_nil photo['secret']
    end
  end

  test "format of url for favorite photos" do
    favourites = Flickr.get_favourites(Flickr::USERS[0])
    favourites.each do |photo|
      assert_match %r{^http:\/\/farm.+\.static\.flickr\.com.+\/.+\_.+_m\.jpg$}i, Flickr.url_for(photo)
    end
  end
end