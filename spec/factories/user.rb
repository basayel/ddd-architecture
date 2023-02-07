# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "#{FFaker::Name.name}-#{n}" }
    active { true }
  end
end
