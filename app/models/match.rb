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

class Match < ActiveRecord::Base
end
