class CreateSettori < ActiveRecord::Migration
  def change
    create_table :settori do |t|
      t.string :nome

      t.timestamps
    end
  end
end
