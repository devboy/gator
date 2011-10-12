require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::ApplicationConfiguration do

  before :each do
    @app_config = Gator::ApplicationConfiguration.new
  end

  it "should have a project configuration" do
    @app_config.project.should be_a_kind_of Gator::Project
  end

  it "should have an environment configuration" do
    @app_config.environment.should be_a_kind_of Gator::Configuration
  end

  it "should have an env shortcut to environment" do
    @app_config.env.should equal @app_config.environment
  end

end