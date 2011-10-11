require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::Task do

  before :all do

    class TaskWithoutParent < Gator::Task
      define :command => "TaskWithoutParent", :short => "TWOP",
             :usage => "TaskWithoutParent is useless", :description => "TaskWithoutParent doesn't need a description"
    end

    class TaskWithParent < Gator::Task
      define :command => "TaskWithParent", :short => "TWP",
             :usage => "TaskWithParent is useless", :description => "TaskWithParent doesn't need a description"
    end

    class TaskContainer < Gator::Command
      define :command => "TaskContainer", :short => "TC",
             :usage => "TaskContainer is useless", :description => "TaskContainer doesn't need a description"

      register_subcommand TaskWithParent
    end

  end

  after :all do
    remove_const TaskWithoutParent
    remove_const TaskWithParent
    remove_const TaskContainer
  end

  describe "ClassMethods" do

    it "should return the correct definition" do
      TaskWithoutParent.definition[:command].should == "TaskWithoutParent"
      TaskWithoutParent.definition[:short].should == "TWOP"
      TaskWithoutParent.definition[:usage].should == "TaskWithoutParent is useless"
      TaskWithoutParent.definition[:description].should == "TaskWithoutParent doesn't need a description"
    end

    it "should return the correct parent command" do
      TaskWithParent.parent.should equal TaskContainer
    end

    it "should return nil when it does not have a parent command" do
      TaskWithoutParent.parent.should_not be
    end

  end

  describe "InstanceMethods" do

    before :each do
      @task_with_parent = TaskWithParent.new
      @task_without_parent = TaskWithoutParent.new
    end

    it "should return the correct definition" do
      @task_without_parent.definition[:command].should == "TaskWithoutParent"
      @task_without_parent.definition[:short].should == "TWOP"
      @task_without_parent.definition[:usage].should == "TaskWithoutParent is useless"
      @task_without_parent.definition[:description].should == "TaskWithoutParent doesn't need a description"
    end

    it "should return the correct parent command" do
      @task_with_parent.parent.should equal TaskContainer
    end

    it "should return nil when it does not have a parent command" do
      @task_without_parent.parent.should_not be
    end

    it "should return nil for requests to subcommands" do
      @task_with_parent.get_subcommand.should_not be
    end

    it "should return nil for requests to resolve subcommands when it does not have a parent" do
      @task_without_parent.resolve_subcommand("test").should_not be
    end

    it "should return nil for requests to resolve subcommands with a wrong command name" do
      @task_with_parent.resolve_subcommand("TaskContainer_").should_not be
    end

    it "should return the parent task for requests with the parents command name" do
      @task_with_parent.resolve_subcommand( [@task_with_parent.parent.definition[:command]] ).should equal @task_with_parent.parent
    end

    it "should return its class for requests with the its command name" do
      @task_with_parent.resolve_subcommand( [@task_with_parent.definition[:command]] ).should equal @task_with_parent.class
    end

  end

end