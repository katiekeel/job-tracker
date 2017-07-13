FactoryGirl.define do
  factory :job do
    sequence :title do |i|
      "Chicken Sexer #{i}"
    end
    level_of_interest 10000
    city "Chickenville"
    company
  end
end
