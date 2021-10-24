class CreateRoominfos < ActiveRecord::Migration[6.1]
  def change
    create_table :roominfos do |t|
      t.string :room_name
      t.text :intro
      t.integer :price
      t.text :address

      t.timestamps
    end
  end
end
