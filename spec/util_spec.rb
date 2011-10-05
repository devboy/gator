require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe Gator::Util do

  it "should contain the correct filenames" do
    Gator::Util.gator_files.include?("gator").should == true
    Gator::Util.gator_files.include?("gator.rb").should == true
  end

  it "should contain the correct filenames for directory" do
    Gator::Util.project_file_paths("testdir").include?("testdir/gator").should == true
    Gator::Util.project_file_paths("testdir").include?("testdir/gator.rb").should == true
  end

  it "should provide the correct gator root directory" do
    Gator::Util.gator_root.should == File.join(File.expand_path("~"), ".gator")
  end

  it "should provide the correct scaffolds template directory" do
    Gator::Util.scaffold_template_root.should == File.join(Gator::Util.gator_root, "templates", "scaffolds")
  end

  it "should load a rubyfile correctly"

  it "should find the gator project directory from project base directory" do
    project_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/empty_gator_project')
    Gator::Util.find_project_dir(project_dir).should == project_dir
  end

  it "should find the gator project directory from a project subdirectory" do
    project_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/empty_gator_project')
    sub_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/empty_gator_project/sub_dir')
    Gator::Util.find_project_dir(sub_dir).should == project_dir
  end

  it "should find the gator.rb file from project base directory" do
    project_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/empty_gator_project')
    file = File.join(project_dir, "gator.rb")
    Gator::Util.find_gator_project_file(project_dir).should == file
  end

  it "should find the gator.rb file from a project subdirectory" do
    project_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/empty_gator_project')
    sub_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/empty_gator_project/sub_dir')
    file = File.join(project_dir, "gator.rb")
    Gator::Util.find_gator_project_file(sub_dir).should == file
  end

  it "should not find a gator project in a project without gator.rb from the its base directory" do
    project_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/no_gator_file')
    Gator::Util.find_project_dir(project_dir).should == nil
  end

  it "should not find a gator project in a project without gator.rb from the a subdirectory" do
    project_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures/no_gator_file/subdir')
    Gator::Util.find_project_dir(project_dir).should == nil
  end

end