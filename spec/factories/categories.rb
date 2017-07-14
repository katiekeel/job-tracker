FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "Fun with Chickens #{i}"
    end
  end
end
