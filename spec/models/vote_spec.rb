require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should be_kind_of(ActiveRecord::Base) }
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it_behaves_like :acts_as_statusable
  it { should validate_numericality_of(:value) }
end
