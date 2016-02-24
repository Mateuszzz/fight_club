FactoryGirl.define do
  
  factory :skill do
    fighter
    sequence(:name) { |n| "#{Faker::Lorem.word} #{n}" }
    level 1
  end
end
