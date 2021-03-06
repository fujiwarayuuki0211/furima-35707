FactoryBot.define do
  factory :record_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipality   { '新宿区' }
    address        { '1-1' }
    building       { '新宿ビル' }
    phone_number   { '12345678910' }
  end
end
