require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class CommandA < Gator::Command
  define :command => "a", :short => "a",
  :usage => "a", :description => "a"
end

class CommandB < Gator::Command
  define :command => "b", :short => "b",
  :usage => "b", :description => "b"
end

class CommandC < Gator::Command
  define :command => "c", :short => "c",
  :usage => "c", :description => "c"
end

class TaskA < Gator::Task

  define :command => "task", :short => "task",
         :usage => "task", :description => "task"
end

class TaskB < Gator::Task

  define :command => "taskB", :short => "taskB",
         :usage => "taskB", :description => "taskB"
end

class SpecCollection < Gator::Command
  define :command => "collection", :short => "c",
  :usage => "collection", :description => "collection"

  register_subcommand CommandA
  CommandA.register_subcommand CommandB
  register_subcommand CommandC
  register_subcommand TaskA
end

describe Gator::ActAsCommand do

  it "should contain the correct definition" do
    CommandA.definition[:command].should == "a"
    CommandA.definition[:short].should == "a"
    CommandA.definition[:usage].should == "a"
    CommandA.definition[:description].should == "a"
  end

  it "should have the correct parent" do
    CommandB.parent.should == CommandA
    CommandA.parent.should == SpecCollection
    SpecCollection.parent.should == nil
    TaskA.parent.should == SpecCollection
    TaskB.parent.should == nil
  end

  it "should contain the correct definition instance method" do
    CommandA.new.definition[:command].should == "a"
    CommandA.new.definition[:short].should == "a"
    CommandA.new.definition[:usage].should == "a"
    CommandA.new.definition[:description].should == "a"
  end

  it "should have the correct parent instance method" do
    CommandB.new.parent.should == CommandA
    CommandA.new.parent.should == SpecCollection
    SpecCollection.new.parent.should == nil
  end

  it "should return nil for a subcommand request" do
    TaskA.new.get_subcommand("a").should be nil
  end

  it "should return nil for resolve_subcommand when it doesn't have a parent" do
    TaskB.new.resolve_subcommand("a").should be nil
  end

  it "should return the correct subcommand for resolve_subcommand" do
    TaskA.new.resolve_subcommand(["collection"]).should be SpecCollection
  end

end

describe Gator::ActAsCommandCollection do

  it "should provide the correct subcommands" do
    SpecCollection.get_subcommand("a").should == CommandA
    SpecCollection.get_subcommand("c").should == CommandC
  end

  it "should provide the correct nested subcommands" do
    SpecCollection.get_subcommand("a","b").should == CommandB
  end

  it "should return nil if a command cannot be found" do
    SpecCollection.get_subcommand("d").should == nil
  end

  it "should resolve the correct subcommand on a parent" do
    CommandB.resolve_subcommand(["a"]).should == CommandA
    CommandB.resolve_subcommand(["c"]).should == CommandC
  end

  it "should resolve the correct nested subcommand on a parent" do
    CommandC.resolve_subcommand(["a","b"]).should == CommandB
  end

  it "should fall back to CommandB" do
    CommandC.resolve_subcommand(["a","d"],["a","b"]).should == CommandB
  end

  it "should return nil if a command cannot be resolved" do
    CommandC.resolve_subcommand("d").should == nil
  end

end

describe Gator::Command do

  it "should be covered by Gator::ActAsCommandCollection & Gator::ActAsCommand" do
  end

end

describe Gator::Task do

  it "should be covered by Gator::ActAsCommand" do
  end

end