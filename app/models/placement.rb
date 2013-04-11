class Placement < ActiveRecord::Base
  attr_accessible :ad_place_id, :banner_id, :click_count, :show_count, :show_max
  belongs_to :banner
  belongs_to :ad_place
end
