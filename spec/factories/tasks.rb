FactoryBot.define do
  factory :task do
    project

    status { "todo" }
  end
end
