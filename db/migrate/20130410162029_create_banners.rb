class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.integer :show_max

      t.timestamps
    end
  end
end
