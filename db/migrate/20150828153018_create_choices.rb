class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :text, null: false
      t.references :question, null: false
      t.timestamps null: false
    end
  end
end
