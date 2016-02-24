FactoryGirl.define do
  
  factory :fighter do 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description "The best fighter of ever!"
    experience_points 0
    avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    #avatar { fixture_file_upload("#{Rails.root}/spec/support/fixtures/image.jpg", 'image/jpg') }
    
    factory :fighter_with_skills do
      transient do
        skills_count 2
      end

      after(:create) do |fighter, evaluator|
        create_list(:skill, evaluator.skills_count, fighter: fighter)
      end
    end
  end
end
