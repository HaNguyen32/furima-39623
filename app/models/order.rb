class Order < ApplicationRecord
has_one :address
belongs_to :item
belongs_to :user
validates :user_id, presence: true 
validates :item_id, presence: true 
end
