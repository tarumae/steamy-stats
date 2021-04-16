class ChangeTimeToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :statistics, :time, :float
  end
end
