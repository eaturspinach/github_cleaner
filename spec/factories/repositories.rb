# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    name "my_cool_repository"
    url "http://github.com/eaturspinach/my_cool_repository"
  end
end
