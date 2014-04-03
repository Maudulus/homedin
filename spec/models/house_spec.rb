require 'spec_helper'

describe House do
  let(:blank) {["", nil]}


  describe 'validations' do
    it 'accepts house as valid' do
      house = FactoryGirl.create(:house)
      house2 = FactoryGirl.create(:house, )
      expect(house).to be_valid
      expect(house2).to be_valid

    end

  end
end
