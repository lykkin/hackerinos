FactoryGirl.define do
    factory :hackerino do
        sequence(:title)  { |n| "Hackerino #{n}" }
        sequence(:url) { |n| "www.#{n}.com"}   
        sequence(:author) { |n| "author#{n}"}   
    end

    factory :comment do
        content "Lorem ipsum"
        user
    end
end
