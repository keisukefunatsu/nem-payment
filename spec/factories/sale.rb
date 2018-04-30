FactoryGirl.define do
  factory :sale do
    price_yen 100
    price_xem 2.23
    xem_address 'NAL7Z3-525F5G-OSSUF7-OB6EVE-BBLDFG-4M3C2F-47TS'
    xem_message 'xem message required by auto confirmation'
    confirmed false
    memo 'some memo'
  end
end