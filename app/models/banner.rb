class Banner < ActiveRecord::Base
  attr_accessible :name, :show_max, :image, :url, :show_count

  has_attached_file :image, :styles => { :thumb => "100x100>" }

  has_many :placements, :dependent => :destroy
  has_many :ad_places, :through => :placements

  after_save :update_placements

  private

  def update_placements
  	self.placements.update_all :show_max => show_max
  end
end
