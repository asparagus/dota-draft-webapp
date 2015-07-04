class HeroesController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def update_all
    require 'net/http'
    require 'json'
    require 'cgi'

    @heroes = Hero.all
    @domain = 'api.steampowered.com'
    @path = '/IEconDOTA2_570/GetHeroes/v0001/'
    @params = {:key => api_key, :language => 'en-us'}

    @new_heroes = []
    @hero_data = JSON.parse(http_get(@domain, @path, @params))

    if @hero_data['result']['status'] == 200
      @hero_data['result']['heroes'].each do |hero|

        @hero = Hero.where(dota_id: hero['id']).first_or_create do
          @new_heroes << @hero
        end
        @hero.name = hero['localized_name']
        @hero.save

      end
    end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :dota_id)
  end
end
