FactoryGirl.define do
  factory :favorite do
    user { User.first || FactoryGirl.create(:user) }
    post { Post.first || FactoryGirl.create(:post) }  
  end

end
