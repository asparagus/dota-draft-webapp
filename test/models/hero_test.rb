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

require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
