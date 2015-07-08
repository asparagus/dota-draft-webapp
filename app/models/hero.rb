# == Schema Information
#
# Table name: heroes
#
#  id             :integer          not null, primary key
#  dota_id        :integer
#  name           :string
#  created_at     :datetime
#  updated_at     :datetime
#  icon           :string
#  main_attribute :integer
#

class Hero < ActiveRecord::Base
  enum stats: { :strength => 0, :agility => 1, :intelligence => 2 }

  def pick_rate
    n_matches = Match.count
    n_picks = matches_picked.count

    n_picks * 1.0 / n_matches
  end

  def win_rate
    n_matches = matches_picked.count
    n_wins_radiant  = Match.where(radiant_win: true,  id: HeroMatch.where(hero_id: id, player_slot:   0..4  ).pluck(:match_id)).count
    n_wins_dire     = Match.where(radiant_win: false, id: HeroMatch.where(hero_id: id, player_slot: 128..132).pluck(:match_id)).count
  
    (n_wins_radiant + n_wins_dire) * 1.0 / n_matches
  end

  def matches_picked
    Match.where(id: HeroMatch.where(hero_id: id).pluck(:match_id))
  end
end
