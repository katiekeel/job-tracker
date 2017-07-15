FactoryGirl.define do
  factory :contact do
    sequence :name do |i|
      "Satan McChicken #{i}"
    end

    sequence :position do |i|
      "Chicken Lord #{i}"
    end

    sequence :email do |i|
      "chickenboss#{i}@screwyou.com"
    end

    company
  end
end
