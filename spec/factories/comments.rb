FactoryBot.define do
  factory :comment do
    place {"hawaii"}
    text   {"楽しそう"}
    image  {"hoge.png"}
    member
  end


end