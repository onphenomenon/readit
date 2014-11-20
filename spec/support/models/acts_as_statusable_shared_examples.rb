shared_examples :acts_as_statusable do |factory|
  it { should define_enum_for(:status).with([:active, :inactive, :deleted]) }

  describe 'active scope' do
    before(:all) do
      FactoryGirl.create_list(factory, 5)
      FactoryGirl.create_list(factory, 5, status: :inactive)
    end

    it 'returns only active data' do
      decribed_class.active.each do |v|
        expect(v.status).to eq 'active'
      end
    end
  end
end
