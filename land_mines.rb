require 'pp'
require_relative 'mine'
require_relative 'mines'

filename = ARGV.first

mines = open(filename).each_line.map { |l| Mine.new(l.split(' '))  }
mines = Mines.new(mines)
p "x,y | blowable_mines.count | explosions | time_taken"
mines.mine_layout.each { |m| p "#{m.x},#{m.y}, #{m.blast_radius} |       #{m.blowable_mines.count} |                #{m.explosions} |          #{m.time_taken}" }
