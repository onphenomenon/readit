require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:post)}
  it { should belong_to(:user)}
  it_behaves_like :acts_as_statusable
end
