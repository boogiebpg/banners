class AddColumnToPlacement < ActiveRecord::Migration
  def change
  	add_column :placements, :show_max, :integer
  end
end
