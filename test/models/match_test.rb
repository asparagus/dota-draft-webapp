# == Schema Information
#
# Table name: matches
#
#  id          :integer          not null, primary key
#  dota_id     :integer
#  radiant_win :boolean
#  duration    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
