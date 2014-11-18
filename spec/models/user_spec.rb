require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:posts) }
  it { should have_many(:favorites) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should be_kind_of(ActiveRecord::Base) }
  it { should be_kind_of(Devise::Models::Confirmable) }
  it { should be_kind_of(Devise::Models::Registerable) }
  it { should be_kind_of(Devise::Models::DatabaseAuthenticatable) }
  it { should be_kind_of(Devise::Models::Recoverable) }
  it { should be_kind_of(Devise::Models::Rememberable) }
  it { should be_kind_of(Devise::Models::Trackable) }
  it { should be_kind_of(Devise::Models::Validatable) }
  it { should be_kind_of(Devise::Models::Lockable) }
  it { should be_kind_of(Devise::Models::Timeoutable) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('mika@laza.com').for(:email) }
  it { should_not allow_value('mika.com').for(:email) }
  it { should ensure_length_of(:email).is_at_most(255) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(5) }
  it_behaves_like :acts_as_statusable
end
