require "minitest/autorun"
require_relative '../mines'
require_relative '../mine'

describe Mines do
  before do
    @mine_field = Mines.new(open("example_mines.txt")
      .each_line
      .map { |l| Mine.new(l.split(' '))}
      )
  end

  describe "when asked for the most dangerous mine" do
    it "must respond with a mine" do
      @mine_field.most_dangerous_mine.must_be_kind_of Mine
    end
  end  
end
