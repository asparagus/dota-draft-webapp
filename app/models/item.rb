# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  dota_id     :integer
#  name        :string
#  created_at  :datetime
#  updated_at  :datetime
#  cost        :integer
#  secret_shop :boolean
#  side_shop   :boolean
#  recipe      :boolean
#

class Item < ActiveRecord::Base
end
