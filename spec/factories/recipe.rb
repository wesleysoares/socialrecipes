FactoryGirl.define do
  factory :recipe do
    sequence(:name_recipe) { |n| "Bolo de chocolate #{n}" }
    amount_people '50'
    preparation_time '60'
    difficulty 'Médio'
    ingredients 'Farinha de trigo e fermento'
    preparation 'Junte tudo e pronto!'
    kitchen
    typefood
    foodpreference
  end
end
