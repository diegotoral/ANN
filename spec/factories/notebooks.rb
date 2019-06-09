FactoryBot.define do
  factory :notebook do
    user

    name { 'Recipes' }

    trait :with_notes do
      after :create do |notebook|
        create_list(:note, 2, notebook: notebook)
      end
    end

    factory :notebook_with_notes, traits: %i[with_notes]
  end
end
