FactoryGirl.define do
  factory :user do
    email "test@test.com"
    first_name "Juanito"
    last_name  "Perez"
    password   "password"
    password_confirmation "password"
  end
end



  