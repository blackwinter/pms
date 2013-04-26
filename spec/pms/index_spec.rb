describe PMS::Index do

  before :each do
    @index = PMS::Index.new(File.read(FOX))
  end

  it 'should raise an error for an invalid token in #results_with_positions' do
    lambda {
      @index.results_with_positions(123)
    }.should raise_error(TypeError)
  end

  it 'should return the document for a given doc_num' do
    @index.doc(3).should == File.readlines(FOX)[3]
  end

end

describe PMS::Index, 'with exhaustable input' do

  before :each do
    # already seeks to EOF in #build_index
    @index = PMS::Index.new(File.open(FOX))
  end

  it 'should return the documents anyway' do
    @index.documents.size.should == 7
  end

end

describe PMS::Index, 'with invalid input' do

  it 'should raise an error' do
    lambda { PMS::Index.new(123) }.should raise_error(ArgumentError)
  end

end
