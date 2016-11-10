FactoryGirl.define do
  factory :user do
    email "sample_emial@sample.com"
    password "password"
    password_confirmation "password"
  end

  factory :tag do
    name "tagNumber1"
    name "tagNumber2"
  end
end
