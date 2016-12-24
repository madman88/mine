require 'pp'
class Mine
  attr_accessor :x , :y, :blast_radius, :blowable_mines, :explosions, :time_taken

  def initialize(args)
    @x =            args[0].to_i
    @y =            args[1].to_i
    @blast_radius = args[2].to_i
    @blowable_mines = []
    @explosions = 0
    @time_taken = 0
  end

  def inside_blast_radius?(mine)
    if ( (x - mine.x) * (x - mine.x) + (y - mine.y) + (y - mine.y) * (y - mine.y) <= blast_radius * blast_radius )
      return true
    else
      return false
    end
  end

end

class Mines
  attr_accessor :mine_layout

  def initialize(mines)
    @mine_layout = mines
    blowable_mines
    explosions
  end

  def explosions
    mine_layout.each { |mine| mine.explosions = cal_explosions(mine);  mine.time_taken = cal_time(mine) }
  end

  def cal_explosions(mine)
    queue = []
    queue << mine
    i = 0
    visited = {}
    mine_layout.each {|mine| visited[mine.object_id] =  false }
    visited[mine.object_id] = true;

    while(queue.size != 0) do
      current_mine = queue.shift
      current_mine.blowable_mines.each do |mine|
        unless visited[mine.object_id]
          visited[mine.object_id] = true
          queue << mine
          i += 1
        end
      end
    end
    i
  end

  def cal_time(mine)
    stack = []
    stack << mine
    i = -1
    visited = {}
    mine_layout.each {|mine| visited[mine.object_id] =  false }
    visited[mine.object_id] = true

    while(stack.size != 0) do
      current_mine = stack.pop
      i += 1
      current_mine.blowable_mines.each do |mine|
        unless visited[mine.object_id]
          visited[mine.object_id] = true
          stack << mine
        end
      end
    end
    i
  end

  def blowable_mines
    (0..mine_layout.size-1).each do |i|
      (0..mine_layout.size-1).each do |j|
        if (mine_layout[i].inside_blast_radius?(mine_layout[j]) && mine_layout[i] != mine_layout[j])
          mine_layout[i].blowable_mines << mine_layout[j]
        end
      end
    end
  end
end

filename = ARGV.first

mines = open(filename).each_line.map { |l| Mine.new(l.split(' '))  }

mines = Mines.new(mines)
p "x,y | blowable_mines.count | explosions | time_taken"
mines.mine_layout.each { |m| p "#{m.x},#{m.y}, #{m.blast_radius} |       #{m.blowable_mines.count} |                #{m.explosions} |          #{m.time_taken}" }
