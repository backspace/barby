require 'test_helper'
require 'barby/barcode/codabar'

class CodabarTest < Barby::TestCase
  before do
    @data = "32212005675122"
    @code = Codabar.new(@data)
  end

  it "should return the same data it was given" do
    @code.data.must_equal @data
  end

  it "should have the expected characters" do
    @code.characters.must_equal %w(3 2 2 1 2 0 0 5 6 7 5 1 2 2)
  end

  it "should have the expected encoding" do
    @code.encoding.must_equal "101100010001011000101010101000101101010001011010101100010101000101101010100011010101000110110101000101000101011010001011010110101000101010110001010100010110101000101101011000100010"
  end

  it "should be valid" do
    assert @code.valid?
  end
end