require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:user)}
  it { should belong_to(:post)}
  it { should define_enum_for(:status).with([:active, :inactive, :deleted])}
  it { should ensure_length_of(:description).is_at_most(65535)}
end
