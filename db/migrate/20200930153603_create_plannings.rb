class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.string :name, null: false
      t.integer :status, limit: 2, default: 0, null: false
      t.timestamps
    end

    add_index :plannings, :name, unique: true
  end
end
