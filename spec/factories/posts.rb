FactoryGirl.define do
  factory :post, class: 'Post' do
    title 'A Post'
    description 'My dog at my homework!'
    rank 1
    user { User.first || FactoryGirl.create(:user) }
    topic { Topic.first || FactoryGirl.create(:topic, title: 'New Title') }
  end
end
