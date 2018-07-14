class AddParentToBubble < ActiveRecord::Migration[5.2]
  def change
    add_column :bubbles, :parent_id, :integer
  end
end
