shared_examples :acts_as_statusable do
  it { should define_enum_for(:status).with([:active, :inactive, :deleted])}
end  	