require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::Configuration do

  before :all do
    class ConcreteConfiguration < Gator::Configuration
    end
  end

  after :all do
    remove_const ConcreteConfiguration
  end

  before :each do
    @configuration = ConcreteConfiguration.new
  end

  it "should add a property getter" do
    @configuration.add_property :my_prop
    @configuration.should respond_to "my_prop"
  end

  it "should add a property setter" do
    @configuration.add_property :my_prop
    @configuration.should respond_to "my_prop="
  end

  it "should set and get a property via its setter" do
    a = {}
    @configuration.add_property :a
    @configuration.a= a
    @configuration.a.should eql(a)
  end

  it "should add a value" do
    a = {}
    @configuration.add_property :my_prop, a
    @configuration.my_prop.should eql(a)
  end

  it "should yield around a property" do
    a = {}
    @configuration.add_property :my_prop, a
    @configuration.my_prop do |property|
      property.should eql(a)
    end
  end

end