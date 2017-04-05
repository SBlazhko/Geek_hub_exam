class CreateRecomendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recomendations do |t|
      t.string :text
      t.integer :point
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
