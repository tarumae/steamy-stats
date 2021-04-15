class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.string :description
      t.integer :time

      t.timestamps
    end
  end
end
