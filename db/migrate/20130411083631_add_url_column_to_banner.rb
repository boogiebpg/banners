class AddUrlColumnToBanner < ActiveRecord::Migration
  def change
  	add_column :banners, :url, :string
  end
end
