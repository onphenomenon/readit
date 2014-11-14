require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:user)}
  it { should belong_to(:post)}
  it_behaves_like :acts_as_statusable
  it { should ensure_length_of(:description).is_at_most(65535)}
end
