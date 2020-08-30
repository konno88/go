class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.text :introduction
      t.integer :gender
      t.integer :location
      t.integer :musical_instrument
      t.date :birthday
      t.boolean :subscribed
      t.timestamps
    end
  end
end