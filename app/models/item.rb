class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image


    with_options presence: true do
        validates :name
        validates :category_id
        validates :sales_status_id
        validates :shipping_fee_status_id
        validates :prefecture_id
        validates :schuduled_delivery_id
        validates :price
    end
end
