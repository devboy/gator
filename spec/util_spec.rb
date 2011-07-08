#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
#
#require "fileutils"
#
#describe Gator::Project::Base do
#
#  it "has the correct attributes" do
#    test_project = Gator::Project::Base.new "test_project"
#    test_project.name.should == "test_project"
#    test_project.layout.should == Gator::Project::Layout.default
#  end
#
#end
#
#describe Gator::Project do
#
#  before(:all) do
#    @project_dir = File.expand_path("project_spec_directory_test")
#    FileUtils.mkdir_p File.join(@project_dir,".gator")
#    FileUtils.mkdir_p File.join(@project_dir,"sub")
#    File.open(File.join(@project_dir,".gator","project.rb"), 'w') {|f| f.write("-empty-") }
#  end
#
#  after(:all) do
#    FileUtils.rm_r @project_dir
#    @project_dir = nil
#  end
#
#  value(something).shouldEqual(somethingElse).orElse("it doesn't work")
#
#  it "should detect being inside a project directory" do
#    Gator::Project.is_project_directory(@project_dir).should == true
#  end
#
#  it "should detect the correct project directory from within a project subdirectory" do
#    Gator::Project.get_project_directory_of_subdirectory(File.join(@project_dir,"sub")).should == @project_dir
#  end
#
#  it "should detect being inside a project subdirectory" do
#    Gator::Project.is_project_subdirectory(File.join(@project_dir,"sub")).should == true
#  end
#
#  it "should not detect being inside a project directory" do
#    Gator::Project.is_project_directory(File.join(@project_dir,"sub")).should == false
#  end
#
#  it "should not detect being inside a project subdirectory" do
#    Gator::Project.is_project_directory(File.expand_path("~")).should == false
#  end
#
#end