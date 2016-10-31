FactoryGirl.define do
  factory :user do
    email "sample_emial@sample.com"
    password "password"
    password_confirmation "password"
  end
end
