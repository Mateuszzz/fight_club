FactoryGirl.define do
  
  factory :fighter do 
    first_name "Tom"
    last_name "Fighter"
    description "The best fighter!"
    experience_points 0
    avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    #avatar { fixture_file_upload("#{Rails.root}/spec/support/fixtures/image.jpg", 'image/jpg') }
  end
end
