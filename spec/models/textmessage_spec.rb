require 'spec_helper'

describe Textmessage do
  it { should belong_to :house }
  it { should belong_to :user }

  it { should have_valid(:date_time).when('2014/April/15')}
  it { should_not have_valid(:date_time).when('2014/April/15000') }
  it { should_not have_valid(:date_time).when('2014/ZZZ/14') }
  it { should_not have_valid(:date_time).when(nil, '') }

  it { should have_valid(:phone_number).when("+12035270200") }
  it { should have_valid(:phone_number).when('12035270200')}
  it { should_not have_valid(:phone_number).when('2035270200')}
  it { should_not have_valid(:phone_number).when(nil, '') }
  it { should_not have_valid(:phone_number).when('035270200')}
end
