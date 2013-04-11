class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.integer :ad_place_id
      t.integer :banner_id
      t.integer :show_count
      t.integer :click_count

      t.timestamps
    end
  end
end
