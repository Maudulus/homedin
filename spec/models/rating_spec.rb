require 'spec_helper'

describe Rating do
  it {should have_valid(:value).when('5')}
    it {should have_valid(:value).when('hello')}

  it { should belong_to :house }
  it { should belong_to :user }
end
