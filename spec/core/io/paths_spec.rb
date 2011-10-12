require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')


describe Gator::Paths do

  before :all do
    @original_pwd = Dir.pwd
    @empty_project = File.expand_path(File.dirname(__FILE__) + '/../../fixtures/empty_gator_project')
    @not_a_project = File.expand_path(File.dirname(__FILE__) + '/../../fixtures/no_gator_file')
  end

  after :all do
    Dir.chdir @original_pwd
  end

  it "should point to the correct gator home in the users directory" do
    Gator::Paths.gator_home.should == File.join(Thor::Util.user_home,".gator")
  end

  it "should point to the correct project base directory" do
    Dir.chdir @empty_project
    Gator::Paths.project_home.should == @empty_project
  end

  it "should point to the correct environment file" do
    Gator::Paths.gator_env_file == File.join( Gator::Paths.gator_home, "environment.rb" )
  end

  it "should return nil for project base directory when not in a project directory" do
    Dir.chdir @not_a_project
    Gator::Paths.project_home.should_not be
  end

  it "should point to the correct project file" do
    Dir.chdir @empty_project
    Gator::Paths.project_file.should == File.join(@empty_project,"gator.rb")
  end

  it "should return nil for project file when not in a project directory" do
    Dir.chdir @not_a_project
    Gator::Paths.project_file.should_not be
  end

end