class AdPlace < ActiveRecord::Base
  attr_accessible :code, :name, :banner_ids

  has_many :placements, :dependent => :destroy
  has_many :banners, :through => :placements

  before_create :generate_code
  after_save :update_placements

  # accepts_nested_attributes_for :banners

  private

  def generate_code
  	self.code = Digest::MD5.hexdigest("#{Time.now}#{name}")
  end

  def update_placements
  	self.placements.each do |placement|
  		placement.update_attributes :show_max => placement.banner.show_max
  	end
  end
end
