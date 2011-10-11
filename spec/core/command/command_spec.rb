require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::Command do

  before :all do

    class CommandA < Gator::Command
      define :command => "CommandA", :short => "CA",
             :usage => "CommandA is useless", :description => "CommandA doesn't need a description"
    end

    class CommandB < Gator::Command
      define :command => "CommandB", :short => "CB",
             :usage => "CommandB is useless", :description => "CommandB doesn't need a description"
    end

    class CommandC < Gator::Command
      define :command => "CommandC", :short => "CC",
             :usage => "CommandC is useless", :description => "CommandC doesn't need a description"
    end

    class CommandD < Gator::Command
      define :command => "CommandD", :short => "CD",
             :usage => "CommandD is useless", :description => "CommandD doesn't need a description"
    end

    CommandA << CommandB
    CommandA << CommandC
    CommandC << CommandD

  end

  after :all do

    remove_const CommandA
    puts "commandA: #{CommandA}"
    remove_const CommandB
    remove_const CommandC
    remove_const CommandD

  end


  describe "ClassMethods" do

    it "should provide the correct subcommands" do
      CommandA.get_subcommand("CommandB").should equal CommandB
      CommandA.get_subcommand("CommandC").should equal CommandC
    end

    it "should provide the correct nested subcommands" do
      CommandA.get_subcommand("CommandC", "CommandD").should equal CommandD
    end

    it "should return nil if a command cannot be found" do
      CommandA.get_subcommand("CommandZ").should_not be
    end

    it "should resolve the correct subcommand on a parent" do
      CommandB.resolve_subcommand(["CommandA"]).should == CommandA
    end

    it "should resolve the correct nested subcommand on a parent" do
      CommandD.resolve_subcommand(["CommandA", "CommandB"]).should == CommandB
    end

    it "should fall back to CommandB" do
      CommandC.resolve_subcommand(["CommandA", "CommandD"], ["CommandA", "CommandB"]).should == CommandB
    end

    it "should return nil if a command cannot be resolved" do
      CommandC.resolve_subcommand("d").should == nil
    end

  end

  describe "InstanceMethods" do

    before :each do
      @command_a = CommandA.new
      @command_b = CommandB.new
      @command_c = CommandC.new
      @command_d = CommandD.new
    end

     it "should provide the correct subcommands" do
      @command_a.get_subcommand("CommandB").should equal CommandB
      @command_a.get_subcommand("CommandC").should equal CommandC
    end

    it "should provide the correct nested subcommands" do
      @command_a.get_subcommand("CommandC", "CommandD").should equal CommandD
    end

    it "should return nil if a command cannot be found" do
      @command_a.get_subcommand("CommandZ").should_not be
    end

    it "should resolve the correct subcommand on a parent" do
      @command_a.resolve_subcommand(["CommandA"]).should == CommandA
    end

    it "should resolve the correct nested subcommand on a parent" do
      @command_d.resolve_subcommand(["CommandA", "CommandB"]).should == CommandB
    end

    it "should fall back to CommandB" do
      @command_c.resolve_subcommand(["CommandA", "CommandD"], ["CommandA", "CommandB"]).should == CommandB
    end

    it "should return nil if a command cannot be resolved" do
      @command_c.resolve_subcommand("d").should == nil
    end

  end

end