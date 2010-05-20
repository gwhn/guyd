class HomeController < ApplicationController
  before_filter :get_flickr_favourites,
                :get_philosophical_quotations,
                :only => :index

  def index
  end

  private

  def get_flickr_favourites
    @slides = Flickr.get_favourites(:per_page => 20)
  end

  def get_philosophical_quotations
    section = Section.find_by_name('Philosophical Quotations')
    @quotes = section.contents if section
  end
end
