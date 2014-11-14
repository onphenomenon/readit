require 'rails_helper'

RSpec.describe Post, :type => :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:topic)}
  it { should belong_to(:user)}
  it { should define_enum_for(:status).with([:active, :inactive, :deleted])}
  it { should ensure_length_of(:title).is_at_most(255)}
  it { should ensure_length_of(:description).is_at_most(65535)}
  # it should have a rank
end
