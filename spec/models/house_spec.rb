require 'spec_helper'

describe House do
  let(:blank) {["", nil]}


  describe 'validations' do
    it 'accepts house as valid' do
      house = FactoryGirl.build(:house)
      expect(house).to be_valid

    end
    it {should have_many :ratings}
    it {should have_many :emails}
    it {should have_many :comments}
    it {should have_many :textmessages}

    it { should have_valid(:price).when (30000)}
    it {should_not have_valid(:price).when ('thirty-thousand')}


    #it { should have_valid(:town).when ()}
  end
end
