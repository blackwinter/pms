describe PMS::Proxy do

  before :each do
    @proxy = PMS::Proxy.new(PMS.new(File.read(FOX)))
  end

  it 'should raise an error for an invalid operator in #apply_operator' do
    lambda {
      @proxy.send(:apply_operator, 'foo', [])
    }.should raise_error(ArgumentError)
  end

end
