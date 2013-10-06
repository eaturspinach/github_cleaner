FactoryGirl.define do
  factory :authentication do
  	provider "Github"
  	sequence(:uid) { |n| "#{n}111111111"}
  	user
  end
end  

