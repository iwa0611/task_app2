class AddStartDateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :start_date, :date
    add_column :rooms, :end_date, :date
    add_column :rooms, :person_num, :integer
  end
end
