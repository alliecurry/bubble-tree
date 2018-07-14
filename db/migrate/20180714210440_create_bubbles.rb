class CreateBubbles < ActiveRecord::Migration[5.2]
  def change
    create_table :bubbles do |t|
      t.string :name
      t.string :description
      t.references :tree, foreign_key: true

      t.timestamps
    end
  end
end
