class UpdateController < ApplicationController
  
  def heroes
    require 'json'

    @heroes = Hero.all
    @domain = 'api.steampowered.com'
    @path = '/IEconDOTA2_570/GetHeroes/v0001/'
    @params = { :key => api_key, :language => 'en-us' }

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

  def items
    require 'json'

    @items = Item.all
    @domain = 'api.steampowered.com'
    @path = '/IEconDOTA2_570/GetGameItems/v0001/'
    @params = { :key => api_key, :language => 'en-us' }

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

  def matches
    require 'json'

    @domain = 'api.steampowered.com'
    @history = '/IDOTA2Match_570/GetMatchHistory/V001/'
    @details = '/IDOTA2Match_570/GetMatchDetails/V001/'

    @new_matches = []
    @matches_data = JSON.parse(http_get(@domain, @history, { :key => api_key }))

    if @matches_data['result']['status'] == 1
      @matches_data['result']['matches'].each do |match_data|
        @match = Match.where(dota_id: match_data['match_id']).first_or_create do |match|
          @match_details = JSON.parse(http_get(@domain, @details, { :key => api_key, :match_id => match_data['match_id'] }))

          match.radiant_win = @match_details['result']['radiant_win']
          match.duration = @match_details['result']['duration']
          match.save

          @match_details['result']['players'].each do |player_details|
            @hero_match = HeroMatch.new match_id: match.id

            @hero_match.player_slot   = player_details['player_slot']
            @hero_match.hero_id       = player_details['hero_id']
            @hero_match.item_0        = player_details['item_0']
            @hero_match.item_1        = player_details['item_1']
            @hero_match.item_2        = player_details['item_2']
            @hero_match.item_3        = player_details['item_3']
            @hero_match.item_4        = player_details['item_4']
            @hero_match.item_5        = player_details['item_5']
            @hero_match.kills         = player_details['kills']
            @hero_match.deaths        = player_details['deaths']
            @hero_match.assists       = player_details['assists']
            @hero_match.leaver_status = player_details['leaver_status']
            @hero_match.gold          = player_details['gold']
            @hero_match.last_hits     = player_details['last_hits']
            @hero_match.denies        = player_details['denies']
            @hero_match.gpm           = player_details['gold_per_min']
            @hero_match.xpm           = player_details['xp_per_min']
            @hero_match.gold_spent    = player_details['gold_spent']
            @hero_match.hero_damage   = player_details['hero_damage']
            @hero_match.tower_damage  = player_details['tower_damage']
            @hero_match.hero_healing  = player_details['hero_healing']
            @hero_match.save

            player_details['ability_upgrades'].each do |ability_upgrade|
              @hero_match_ability_upgrade = HeroMatchAbilityUpgrade.new(
                hero_match_id: @hero_match.id,
                ability_id: ability_upgrade['ability'],
                level: ability_upgrade['level'],
                time: ability_upgrade['time'])
              @hero_match_ability_upgrade.save
            end if player_details['ability_upgrades']
          end

          @new_matches << @match
        end
        #@match = Match.where(dota_id: match['id']).first_or_create do
          #@new_matches << @match
          # Change here. go into details
        #end
      end
    end
  end


  private
  def http_get(domain, path, params)
    require 'net/http'
    require 'cgi'
    return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))) if not params.nil?
    return Net::HTTP.get(domain, path)
  end

  def api_key
    '66E1C090180F33518933B15FC5766237'
  end
end
