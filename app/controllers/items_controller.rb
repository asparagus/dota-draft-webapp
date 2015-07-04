class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def update_all
    require 'net/http'
    require 'json'
    require 'cgi'

    @items = Item.all
    @domain = 'api.steampowered.com'
    @path = '/IEconDOTA2_570/GetGameItems/v0001/'
    @params = {:key => api_key, :language => 'en-us'}

    @new_items = []
    @item_data = JSON.parse(http_get(@domain, @path, @params))

    if @item_data['result']['status'] == 200
      @item_data['result']['items'].each do |item|

        @item = Item.where(dota_id: item['id']).first_or_create do
          @new_items << @item
        end
        @item.name = item['localized_name']
        @item.cost = item['cost']
        @item.secret_shop = item['secret_shop']
        @item.side_shop = item['side_shop']
        @item.recipe = item['recipe']
        @item.save

      end
    end
  end

end
