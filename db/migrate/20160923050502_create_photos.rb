class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :altitude
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
