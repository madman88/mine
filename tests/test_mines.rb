require "minitest/autorun"
require_relative '../mines'


describe Mines do
  before do
    @mines = Mine.new([1,2,5])
  end

  describe "when asked if a mine is within its blast radius" do
    it "must respond with a boolean" do
      @mine.inside_blast_radius?(Mine.new([2,2,3])).must_equal true
      @mine.inside_blast_radius?(Mine.new([12,22,3])).must_equal false
    end
  end
end
