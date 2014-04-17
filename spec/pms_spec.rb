describe PMS do

  before :each do
    @pms = PMS.new(File.read(FOX))
  end

  it 'should return the original documents' do
    @pms.matches.should == File.readlines(FOX)
  end

  it 'should return the query matches (with token)' do
    @pms.search('fox').and('goose').matches.sort.should == File.readlines(FOX).values_at(3, 6).sort
  end

  it 'should return the query matches (with sub-query)' do
    @pms.search { |q| q.search('goose').or('night') }.matches.sort.should == File.readlines(FOX).values_at(0, 2, 3, 6).sort
  end

  it 'should support boolean operator AND' do
    @pms.search('fox').and('goose').results.sort.should == [3, 6]
  end

  it 'should support boolean operator & (AND)' do
    (@pms/'fox' & 'goose').results.sort.should == [3, 6]
  end

  it 'should support boolean operator OR' do
    @pms.search('fox').or('goose').results.sort.should == [0, 2, 3, 4, 6]
  end

  it 'should support boolean operator | (OR)' do
    (@pms/'fox' | 'goose').results.sort.should == [0, 2, 3, 4, 6]
  end

  it 'should support boolean operator NOT' do
    @pms.search('fox').not('goose').results.sort.should == [0, 4]
  end

  it 'should support boolean operator - (NOT)' do
    (@pms/'fox' - 'goose').results.sort.should == [0, 4]
  end

  it 'should allow chaining of operators' do
    @pms.search('fox').and('goose').not('knife').results.sort.should == [3]
  end

  it 'should allow grouping in sub-queries (for AND)' do
    @pms.search('fox').and { |q| q.search('goose').or('night') }.results.sort.should == [0, 3, 6]
  end

  it 'should allow grouping in sub-queries (for OR)' do
    @pms.search('fox').or { |q| q.search('geese').and('ran') }.results.sort.should == [0, 1, 3, 4, 6]
  end

  it 'should allow grouping in sub-queries (for NOT)' do
    @pms.search('fox').not { |q| q.search('goose').or('night') }.results.sort.should == [4]
  end

  it 'should allow grouping in sub-queries (w/o token)' do
    @pms.search { |q| q.search('goose').or('night') }.results.sort.should == [0, 2, 3, 6]
  end

  it 'should raise an error when block returns an invalid sub-query in #apply_operator_with_block' do
    lambda {
      @pms.search('fox').and { |q| q.class }
    }.should raise_error(RuntimeError)
  end

  it 'should support proximity operator NEAR' do
    @pms.search('fox').near('goose', 10).results.sort.should == [3, 6]
  end

  it 'should support proximity operator % (NEAR)' do
    (@pms/'night' % 'chilly').results.sort.should == [0]
  end

  it 'should support proximity operator ADJACENT' do
    @pms.search('fox').adjacent('goose', 10).results.sort.should == [6]
  end

  it 'should support proximity operator ADJ (ADJACENT)' do
    @pms.search('fox').adj('goose', 10).results.sort.should == [6]
  end

  it 'should support proximity operator ^ (ADJACENT)' do
    (@pms/'chilly' ^ 'night').results.sort.should == [0]
  end

  it 'should search case-insensitively' do
    @pms.search('said').results.sort.should == [1, 4]
    @pms.search('Said').results.sort.should == [1, 4]
  end

  it 'should not modify intermediate results' do
    search1  = @pms.search('fox')
    results1 = search1.results.sort
    results1.should == [0, 3, 4, 6]

    search2  = search1.or('goose')
    results2 = search2.results.sort
    results2.should == [0, 2, 3, 4, 6]

    search2.and('GOAWAYFLAG').results.sort.should == []

    search2.results.sort.should == results2
    search1.results.sort.should == results1
  end

end

describe PMS, 'with LSI' do

  before :each do
    @pms1 = PMS.new(File.read(FOX))
    @pms2 = PMS.new(File.read(FOX), :lsi => true)
  end

  it 'should find more ducks' do
    @pms1.search('ducks').results.should == [1]
    @pms2.search('ducks').results.should == [1, 4, 6]
  end

  it 'should not report positions for LSI terms' do
    @pms1.search('ducks').results_with_positions.values.flatten.should == [12]
    @pms2.search('ducks').results_with_positions.values.flatten.should == [12]
  end

end
