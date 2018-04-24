class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.references :search, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
