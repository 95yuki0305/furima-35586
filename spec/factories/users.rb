FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    family_name           {Gimei.name.last.kanji}
    first_name            {Gimei.name.first.kanji}
    family_name_ruby      {Gimei.name.last.katakana}
    first_name_ruby       {Gimei.name.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 90)}
  end
end