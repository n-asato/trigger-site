FactoryBot.define do
  factory :work do
    slug { "MyString" }
    title { "MyString" }
    description { "MyText" }
    client_name { "MyString" }
    year { 1 }
    category { "MyString" }
    tags { "MyText" }
    roles { "MyText" }
    technologies { "MyString" }
    external_link { "MyString" }
    is_published { false }
    published_at { "2025-12-10 22:10:23" }
  end
end
