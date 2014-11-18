shared_examples :acts_as_statusable do
  it { should define_enum_for(:status).with([:active, :inactive, :deleted]) }

  describe 'active scope' do
  	 before(:all) do
      FactoryGirl.create_list(:topic, 5)
      FactoryGirl.create_list(:topic, 5, status: 1)   
      end

    it 'returns only active data' do
      Topic.active.each do |v|
        expect(v.status).to eq 'active'
      end
    end
 end
end 	