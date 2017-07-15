FactoryGirl.define do
  factory :comment do
    sequence :content do |i|
      "This job involves chickens #{i}"
    end
    job
  end
end
