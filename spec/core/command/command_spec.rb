require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

class TestCommandA < Gator::Command::Base
  specify "command_a", "a"
end

class TestCommandB < Gator::Command::Base
  specify "command_b", "b"
end

describe Gator::Command::Base do

  it "has the correct attributes" do
    test_command_a = TestCommandA
    test_command_a.command_name.should == "command_a"
    test_command_a.command_alias.should == "a"
  end

end

describe Gator::Command do

  before(:all) do
    @test_command_a = TestCommandA
    @test_command_b = TestCommandB
  end

  after(:all) do
    @test_command_a = nil
    @test_command_b = nil
  end

  it "should add a command" do
    Gator::Command.add(@test_command_a).should == true
  end

  it "should not add the same command again" do
    Gator::Command.add(@test_command_a).should == false
  end

  it "should add another command though" do
    Gator::Command.add(@test_command_b).should == true
  end

  it "should have a command with name" do
    Gator::Command.has?(@test_command_a.command_name).should == true
  end

  it "should have a command with alias" do
    Gator::Command.has?(@test_command_a.command_alias).should == true
  end

  it "should return TestCommandA by name" do
    Gator::Command.get(@test_command_a.command_name).should == @test_command_a
  end

  it "should return TestCommandA by alias" do
    Gator::Command.get(@test_command_a.command_alias).should == @test_command_a
  end

  it "should remove test_command_a" do
    Gator::Command.remove(@test_command_a).should == true
  end

end
