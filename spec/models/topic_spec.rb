require 'rails_helper'

RSpec.describe Topic, :type => :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should have_many(:posts) }
  it { should ensure_length_of(:title).is_at_most(255) }
  it { should ensure_length_of(:description).is_at_most(65_535) }
  it_behaves_like :acts_as_statusable
end
