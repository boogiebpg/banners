class AddShowCountFieldToBanner < ActiveRecord::Migration
  def change
  	add_column :banners, :show_count, :integer, :default => 0
  end
end
