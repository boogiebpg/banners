class AddImageColumnToBanner < ActiveRecord::Migration
  def self.up
    add_attachment :banners, :image
  end

  def self.down
    remove_attachment :banners, :image
  end
end
