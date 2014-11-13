require 'rails_helper'

RSpec.describe Topic, :type => :model do
#topic class should be inherited from here
 it { should be_kind_of(ActiveRecord::Base) }
 it { should have_many(:posts)}
 it { should ensure_length_of(:title).is_at_most(255)}
 it { should ensure_length_of(:description).is_at_most(65535)}
 it { should define_enum_for(:status).with([:active, :inactive, :deleted])}
end
