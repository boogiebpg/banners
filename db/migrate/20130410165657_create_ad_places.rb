class CreateAdPlaces < ActiveRecord::Migration
  def change
    create_table :ad_places do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
