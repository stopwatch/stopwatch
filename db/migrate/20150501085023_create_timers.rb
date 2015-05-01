class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.string  :url_key,    null: false
      t.string  :admin_key,  null: false
      t.integer :time

      t.timestamps null: false
    end
    add_index :timers, :url_key, unique: true
  end
end
