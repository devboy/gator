require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')


describe Gator::Project do

  before :all do
    @original_pwd = Dir.pwd
    @project_dir = File.expand_path(File.dirname(__FILE__) + '/../../fixtures/empty_gator_project')
    Dir.chdir @project_dir
  end

  after :all do
    Dir.chdir @original_pwd
  end

  before :each do
    @project = Gator::Project.new
  end

  it "should have a name property" do
    @project.should respond_to(:name)
    end

  it "should have a layout property" do
    @project.should respond_to(:layout)
  end

  it "should initially have an empty array of template roots" do
    @project.template_roots.should == []
  end

  it "should append the project base directory to a layout mapping" do
    @project.path(:abc).should == File.join( @project_dir, "abc" )
  end

end