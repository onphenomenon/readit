require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:topic) }
  it { should belong_to(:user) }
  it_behaves_like :acts_as_statusable, :post
  it { should ensure_length_of(:title).is_at_most(255) }
  it { should ensure_length_of(:description).is_at_most(65_535) }
  it { should validate_numericality_of(:rank) }
end
