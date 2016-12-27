require "minitest/autorun"
require_relative '../mine'

describe Mine do
  before do
    @mine = Mine.new([1,2,5])
    @mine.mines_exploded << Mine.new([2,2,1])
  end

  describe "when asked if a mine is within its blast radius" do
    it "must respond with a boolean" do
      @mine.inside_blast_radius?(Mine.new([2,2,3])).must_equal true
      @mine.inside_blast_radius?(Mine.new([12,22,3])).must_equal false
    end
  end

  describe "when asked for the list of mines exploded " do
    it "it returns a collection of mine objects" do
      @mine.mines_exploded.must_be_kind_of Array
    end
  end

  describe "when asked for the time intervals taken for blowing everything it can " do
    it "it returns a time interval integer value" do
      @mine.time_taken.must_be_kind_of Integer
    end
  end
end
