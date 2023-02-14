class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new(ENV['flickr_api_key'], ENV['flickr_shared_secret'])
        user_id = params[:user_id]
        begin
            @photo_urls = flickr.people.getPublicPhotos(user_id: user_id)
        rescue Flickr::FailedResponse => e
        end
    end
end
