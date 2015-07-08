# == Schema Information
#
# Table name: hero_matches
#
#  id            :integer          not null, primary key
#  hero_id       :integer
#  player_slot   :integer
#  item_0        :integer
#  item_1        :integer
#  item_2        :integer
#  item_3        :integer
#  item_4        :integer
#  item_5        :integer
#  kills         :integer
#  deaths        :integer
#  assists       :integer
#  leaver_status :integer
#  gold          :integer
#  last_hits     :integer
#  denies        :integer
#  gpm           :integer
#  xpm           :integer
#  gold_spent    :integer
#  hero_damage   :integer
#  tower_damage  :integer
#  hero_healing  :integer
#  level         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  match_id      :integer
#

class HeroMatch < ActiveRecord::Base
  belongs_to :hero
  belongs_to :match
end
