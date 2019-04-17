FactoryBot.define do
  
  factory :todo do
    title       { Faker::Lorem.word }
    description { Faker::Lorem.sentences }
  end
  
  factory :urgent_todo, parent: :todo do
    urgent   { true }
    deadline { 2.days.from_now }
    owner    { Faker::StarWars.character }
  end
  
end