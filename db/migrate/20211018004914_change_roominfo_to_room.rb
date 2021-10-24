class ChangeRoominfoToRoom < ActiveRecord::Migration[6.1]
  def change
    rename_table :roominfos, :rooms
  end
end
