class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :gender_id, null: false
      t.date :birth_date, null: false
      t.integer :prefecture_id, null: false
      t.references :planner, null: false, foreign_key: true
      t.timestamps
    end
  end
end
