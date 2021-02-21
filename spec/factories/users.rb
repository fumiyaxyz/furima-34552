FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    transient do
      person { Gimei.name }
    end
    first_name_kanji { person.first }
    last_name_kanji { person.last }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end
