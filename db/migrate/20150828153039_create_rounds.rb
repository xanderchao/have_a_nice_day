class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :survey, null: false
      t.references :user, null: false
      t.timestamps null: false
    end
  end
end
