FactoryGirl.define do
  
  factory :fight do
    association :first_fighter, factory: :fighter_with_skills
    association :second_fighter, factory: :fighter_with_skills
    winner_id 1
  end
end
