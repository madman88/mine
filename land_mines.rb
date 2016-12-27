require_relative 'mine'
require_relative 'mines'

module LandMines
  def self.write_results(args)
    filename = args.first
    output = args.last
    target = open(output, 'w')
    target.write("(x,y)\t\t| blowable_mines count\t| explosions\t| number of time intervals\t\n")
    mines = read_input_and_return_minefield(filename)
    mines.print_most_dangerous
    mines.mine_layout
      .each { |m| target.write("(#{m.x},#{m.y}, #{m.blast_radius})\t|\t#{m.blowable_mines.count}\t\t|\t#{m.explosions}\t|\t#{m.time_taken}\n") }
  end

  def self.read_input_and_return_minefield(filename)
    Mines.new(open(filename)
      .each_line
      .map { |l| Mine.new(l.split(' '))}
      )
  end
end

LandMines.write_results(ARGV)
