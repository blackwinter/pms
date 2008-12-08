require 'pms/ext'

shared_examples_for 'any Searchable' do

  before :each do
    @args ||= []
  end

  it 'should be searchable by a String' do
    @searchable.search(*@args << 'fox').results.sort.should == [0, 3, 4, 6]
  end

  it 'should be searchable by a Regexp' do
    @searchable.search(*@args << /[au]ck/).results.sort.should == [1, 2, 5]
  end

  it 'should allow boolean combination with AND' do
    @searchable.search(*@args << 'fox').and('goose').results.sort.should == [3, 6]
  end

  it 'should allow boolean combination with OR' do
    @searchable.search(*@args << 'fox').or('goose').results.sort.should == [0, 2, 3, 4, 6]
  end

  it 'should allow boolean combination with NOT' do
    @searchable.search(*@args << 'fox').not('goose').results.sort.should == [0, 4]
  end

end

describe String, ' when extended by pms' do

  before :each do
    @searchable = File.read(FOX)
  end

  it_should_behave_like 'any Searchable'

end

describe IO, ' when extended by pms' do

  before :each do
    @searchable = File.open(FOX)
  end

  it_should_behave_like 'any Searchable'

end

describe Array, ' when extended by pms' do

  before :each do
    @searchable = File.readlines(FOX)
  end

  it_should_behave_like 'any Searchable'

end

describe File, ' when extended by pms' do

  before :each do
    @searchable = File
    @args = [FOX]
  end

  it_should_behave_like 'any Searchable'

end
