require 'test_helper'

class FlickrTest < ActiveSupport::TestCase
  test "should get user id for username" do
    user = Flickr.find_by_username(Flickr::USERS[0])
    assert_equal user['username'], Flickr::USERS[0]
    assert_not_nil user['nsid']
  end

  test "can get favourites from flickr with default options" do
    favourites = Flickr.get_favourites
    puts favourites.to_xml
    favourites.each do |photo|
      assert_not_nil photo['farm']
      assert_not_nil photo['server']
      assert_not_nil photo['id']
      assert_not_nil photo['secret']
      assert_not_nil photo['title']
    end
  end

  test "can override get favourites from flickr using options" do
    username = 'gwhn'
    per_page, page = 2
    favourites = Flickr.get_favourites(:username => username, :per_page => per_page, :page => page)
    puts favourites.to_xml
    assert_equal per_page, favourites.count
    favourites.each do |photo|
      assert_not_nil photo['farm']
      assert_not_nil photo['server']
      assert_not_nil photo['id']
      assert_not_nil photo['secret']
      assert_not_nil photo['title']
    end
  end

  test "format of url for favorite photos" do
    favourites = Flickr.get_favourites
    favourites.each do |photo|
      assert_match %r{^http:\/\/farm.+\.static\.flickr\.com.+\/.+\_.+_m\.jpg$}i, Flickr.url_for(photo)
    end
  end
end