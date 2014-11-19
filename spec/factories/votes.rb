FactoryGirl.define do
  factory :vote do
    value 1
    user { User.first || FactoryGirl.create(:user) }
    post { Post.first || FactoryGirl.create(:post) }
  end

end
