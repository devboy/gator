require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gator::Layout do

  before :each do
    @layout = Gator::Layout.new
  end

  it 'should expand empty to itself' do
    @layout.expand.should eql('')
    @layout.expand('').should eql('')
  end

  it 'should expand array of symbols' do
    @layout.expand(:foo, :bar).should eql('foo/bar')
  end

  it 'should expand array of names' do
    @layout.expand('foo', 'bar').should eql('foo/bar')
  end

  it 'should map symbol to path' do
    @layout[:foo] = 'baz'
    @layout.expand(:foo, :bar).should eql('baz/bar')
  end

  it 'should map symbols to path' do
    @layout[:foo, :bar] = 'none'
    @layout.expand(:foo, :bar).should eql('none')
  end

  it 'should map strings to path' do
    @layout[:foo, "bar"] = 'none'
    @layout.expand(:foo, :bar).should eql('none')
    @layout.expand(:foo, 'bar').should eql('none')
  end

  it 'should ignore nil elements' do
    @layout[:foo, :bar] = 'none'
    @layout.expand(:foo, nil, :bar).should eql('none')
    @layout.expand(nil, :foo).should eql('foo')
  end

  it 'should return nil if path not mapped' do
    @layout[:foo].should be_nil
  end

  it 'should return path from symbol' do
    @layout[:foo] = 'path'
    @layout[:foo].should eql('path')
  end

  it 'should return path from symbol' do
    @layout[:foo, :bar] = 'path'
    @layout[:foo, :bar].should eql('path')
  end

  it 'should do eager mapping' do
    @layout[:one] = 'none'
    @layout[:one, :two] = '1..2'
    @layout.expand(:one, :two, :three).should eql('1..2/three')
  end

end