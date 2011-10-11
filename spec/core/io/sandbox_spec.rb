require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')


describe Gator::Sandbox do

  it "should add a getter for a value" do
    Gator::Sandbox.add_getter :my_getter, "MyValue"
    Gator::Sandbox.my_getter.should == "MyValue"
  end

end