class Bubble < ApplicationRecord
  belongs_to :tree
  belongs_to :parent, class_name: :Bubble, :foreign_key => "parent_id", optional: true
end
