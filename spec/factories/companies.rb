FactoryGirl.define do
  factory :company do
    sequence :name do |i|
      "Chicken Factory #{i}"
    end
  end
end
