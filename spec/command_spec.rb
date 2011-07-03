require File.expand_path('../../../spec/spec_helper', File.dirname(__FILE__))

class ATestCommand < Gator::Command::Base
  def initialize(name, cmd_alias)
    @name = name
    @alias = cmd_alias
  end
end

describe Gator::Command::Base do

  it "has the correct attributes" do
    test_command_a = ATestCommand.new "testa", "a"
    test_command_a.name.should == "testa"
    test_command_a.alias.should == "a"
  end

end

describe Gator::Command do

  before(:all) do
    @test_command_a = ATestCommand.new "testa", "a"
    @test_command_b = ATestCommand.new "testb", "b"
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
    Gator::Command.has?(@test_command_a.name).should == true
  end

  it "should have a command with alias" do
    Gator::Command.has?(@test_command_a.alias).should == true
  end

  it "should return @test_command_a by name" do
    Gator::Command.get(@test_command_a.name).should == @test_command_a
  end

  it "should return @test_command_a by alias" do
    Gator::Command.get(@test_command_a.alias).should == @test_command_a
  end

  it "should remove test_command_a" do
    Gator::Command.remove(@test_command_a).should == true
  end

end
