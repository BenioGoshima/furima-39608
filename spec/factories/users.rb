FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_name_kana       {Faker::Japanese::Name.first_name.yomi}
    last_name_kana        {Faker::Japanese::Name.last_name.yomi}
    birth_date            {Faker::Date.between(from: 50.years.ago, to: 18.years.ago) }
  end
end