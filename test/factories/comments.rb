# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    hackerino_id 1
    content "MyString"
    author "MyString"
  end
end
