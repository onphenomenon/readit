FactoryGirl.define do
  factory :user do
    email 'foo@address.com'
    password 'foobar12'
    encrypted_password 'foobar12'
  end

end
