require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it_behaves_like :acts_as_statusable, :vote
  it { should validate_numericality_of(:value) }
  it { should validate_presence_of(:value) }

context "already_voted?" do
  before(:all) do
    @post = FactoryGirl.create(:post)
  end

  it "raises an exception if user is nil" do
    expect(Vote.already_voted?(nil, @post)).to raise_exception
 end

  it "raises an exception if post is nil" do
    expect(Vote.already_voted?(@post.user, nil)).to raise_exception
  end

  it "returns true if the user has voted for the post" do
FactoryGirl.create(:vote, user: @post.user, post: @post)
   expect(Vote.already_voted?(@post.user, @post)).to eq(true)
 end

  it "retruns false if the user has not voted for the post" do
   expect(Vote.already_voted?(@post.user, @post)).to eq(false)
  end

end


end
