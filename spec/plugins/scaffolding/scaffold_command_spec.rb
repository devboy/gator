require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::Scaffolding::ScaffoldCommand do
  include Gator::Scaffolding

  before :each do
    @scaffold_command = ScaffoldCommand.new
    @file_util = @scaffold_command.send(:file_util)
  end

  it "should have the scaffolds home as source root" do
    ScaffoldCommand.source_root.should == ScaffoldingFileUtils.new.scaffolds_home
  end

  it "should have the correct definition" do
    definition = { :command => "scaffold", :short => "s",
                    :usage => "scaffold TASK", :description => "Set of tasks to manage scaffold templates." }
    ScaffoldCommand.definition.should == definition
  end

  it "should install a scaffold with path & name" do
    path, name = "myPath", "myName"
    @file_util.should_receive(:install_scaffold).with File.expand_path(path), name
    @scaffold_command.install(path, name)
    end

  it "should install a scaffold with path only" do
    path = "myName"
    @file_util.should_receive(:install_scaffold).with File.expand_path(path), nil
    @scaffold_command.install(path)
  end

  it "should uninstall a scaffold" do
    name = "myProjectName"
    @file_util.should_receive(:delete_scaffold).with name
    @scaffold_command.uninstall(name)
  end

  it "should create a new directory from a template" do
    name = "MyName"
    scaffold = "MyScaffold"
    @scaffold_command.should_receive(:directory).with @file_util.scaffold_directory(scaffold), File.expand_path(name)
    @scaffold_command.new name, scaffold
  end

  it "should uninstall all scaffolds" do
    @file_util.should_receive(:delete_all_scaffolds)
    @scaffold_command.wipe
  end

  it "should uninstall all scaffolds" do
    @file_util.should_receive(:delete_all_scaffolds)
    @scaffold_command.wipe
  end

  it "should display the installed scaffolds" do
    entries = ["ScaffoldA", "ScaffoldB", "ScaffoldC"]
    @file_util.stub!(:scaffold_entries).and_return entries
    entries.each do |entry|
       @scaffold_command.should_receive(:say).with "  #{entry}"
    end
    @scaffold_command.list
  end

  it "should display 'No templates found.' scaffold directory is empty" do
    @file_util.stub!(:scaffold_entries).and_return []
    @scaffold_command.should_receive(:say).with 'No templates found.', anything
    @scaffold_command.list
  end

  it "should have a valid file_utils object" do
    @file_util.should be_a Gator::Scaffolding::ScaffoldingFileUtils
  end

end