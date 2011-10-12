require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::Application do

  before :each do
    @app = Gator::Application.new
  end

  it "should print the correct version" do
    version =  File.read( File.dirname(__FILE__) + '/../../../VERSION' )
    @app.should_receive(:say).with(version)
    @app.version
  end

end