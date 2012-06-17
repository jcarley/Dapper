# Dapper

Dapper adds the ability to generate presenters for your rails project.  Presenters are helpful
with cleaning up your views.  You can move any kind of logic out of your view and isolate it
in a presenter.

## Installation

Add this line to your application's Gemfile:

    gem 'dapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dapper

## Usage

Once the gem is installed, run the presenters generator.

    $ rails generate presenter CONTROLLER_NAME [actions]

Example:

    $ rails generate presenter Albums index edit show

The result will be:

    myrailsproject
      |~app/
        |~presenters/
          |~albums/
            |-edit_presenter.rb
            |-index_presenter.rb
            `-show_presenter.rb
      
Running the presenter generator without any actions will default to
one index_presenter.rb


To take advantage of the presenter, instantiate it in your controller.

    class AlbumsController < ApplicationController

      def edit
        album = Album.find(params[:id])
        @presenter = Albums::EditPresenter.new(album)
      end

      def index
        albums = Album.all
        @presenter = Albums::IndexPresenter.new(albums)
      end

      def show
        album = Album.find(params[:id])
        @presenter = Albums::ShowPresenter.new(album)
      end
      
    end

The presenter has access to view templates and helpers.  This makes is very
easy to move ugly logic out of your views and put it in your presenters.  Here
is an example that is pulling some logic for getting the most recent photos
from a photo album.  Granted there are ways to better solve this in the model
itself, but you get the idea.  This type of logic is not uncommon in views.
You could really put any time of display logic in a presenter.  You can also
combine multiple models in a presenter. The big benefit here is that using a
presenter helps to maintain a flattened structure in your views.

    module Albums
      class ShowPresenter < Dapper::Base
        def initialize(album)
          @album = album
        end

        def recent_photos
          unless album.photos.empty?
            album.photos(:photo_id => nil, :order => [:created_at.desc])[0..11].each do |photo|
              h.link_to( h.image_tag(photo.url_thumbnail), photo )
            end
          end
        end

      end
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
