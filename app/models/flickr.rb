require 'httparty'

class Flickr
  include HTTParty

  base_uri 'api.flickr.com'

  USERS = ['gwhn']

  def self.url_for(photo)
    "http://farm#{photo['farm']}.static.flickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_m.jpg"
  end

  def self.get_favourites(options = {})
    options.reverse_merge!({:username => USERS[0], :per_page => 5, :page => 1})
    get('/services/rest/', :query => {
            :method => 'flickr.favorites.getPublicList',
            :api_key => '6ab7a361467c9e9ecf08861153ea28eb',
            :user_id => find_by_username(options[:username])['nsid'],
            :per_page => options[:per_page],
            :page => options[:page]
    })['rsp']['photos']['photo']
  end

  def self.find_by_username(username = USERS[0])
    get('/services/rest/', :query => {
            :method => 'flickr.people.findByUsername',
            :api_key => '6ab7a361467c9e9ecf08861153ea28eb',
            :username => username
    })['rsp']['user']
  end
end