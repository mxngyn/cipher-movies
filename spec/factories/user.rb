FactoryGirl.define do

  factory :user do
    name 'Francis Underwood'
    sequence(:email) { |n| "mister.president_#{n}@whitehouse.gov" }
    password '1234567890'
    password_confirmation { |u| u.password }
  end

end

