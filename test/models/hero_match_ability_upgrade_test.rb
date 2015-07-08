# == Schema Information
#
# Table name: hero_match_ability_upgrades
#
#  id            :integer          not null, primary key
#  hero_match_id :integer
#  ability_id    :integer
#  level         :integer
#  time          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class HeroMatchAbilityUpgradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
