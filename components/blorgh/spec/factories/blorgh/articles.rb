FactoryBot.define do
  factory :blorgh_article, class: 'Blorgh::Article' do
    title { "MyString" }
    text { "MyText" }
    user_id { create(:user).id }
  end
end
