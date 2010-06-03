require 'bart/estimate'

include Bart

describe Estimate do

  it 'should initialize from a block of xml' do
    xml = File.read('spec/files/estimate.xml')
    estimate = Estimate.new(xml)

    estimate.minutes.should == 21
    estimate.platform.should == 2
    estimate.direction.should == 'South'
    estimate.length.should == 5
  end

end
