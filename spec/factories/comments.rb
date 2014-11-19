FactoryGirl.define do
  factory :comment do
    description 'This is a comment for a post'
    user { User.first || FactoryGirl.create(:user) }
    post { Post.first || FactoryGirl.create(:post) }
  end
end
