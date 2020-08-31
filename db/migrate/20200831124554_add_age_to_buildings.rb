class AddAgeToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :age, :integer
  end
end
