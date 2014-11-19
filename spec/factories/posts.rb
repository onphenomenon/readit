FactoryGirl.define do
  factory :post, class: 'Posts' do
    title 'A Post'
    description 'My dog at my homework!'
    user { User.first || FactoryGirl.create(:user) }
    topic { Topic.first || FactoryGirl.create(:topic, title: 'New Title') }
  end
end
