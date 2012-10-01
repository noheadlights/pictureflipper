

class CarouselController < ApplicationController

  def index
    @photos = get_flickr_pictures()
  end

  private
    def get_flickr_pictures
      FlickRaw.api_key="8fa76ef7873d2eac9c08e7773838a19c"
      FlickRaw.shared_secret="0d534faad9611d07"
      @photos = {}
      flickr.photos.search(:user_id => "26276803@N05", :tags => 'b&w').each do |p|
        info = flickr.photos.getInfo(:photo_id => p.id) # retrieve additional details
                                                        # p info # uncomment to see other details
        title = info.title
        square_url = FlickRaw.url_s(info)
        original_url = FlickRaw.url_o(info)
        taken = info.dates.taken
        views = info.views
        tags = info.tags.map {|t| t.raw}
        @photos[title]= FlickRaw.url_m(info)
        #@photos[title] = "Photo #{title} with #{views} views and tags #{tags.join(",")} was taken on #{taken}, see it on #{square_url}"
      end
      return @photos
    end
end
