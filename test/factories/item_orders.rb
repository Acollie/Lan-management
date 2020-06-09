FactoryBot.define do
  factory :item_order do
    order { nil }
    admin_item { nil }
    quantity { 1 }
    price { 1.5 }
  end
end
