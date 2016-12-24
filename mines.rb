class Mines
  attr_accessor :mine_layout

  def initialize(mines)
    @mine_layout = mines
    blowable_mines
    explosions
  end

  def explosions
    mine_layout.each { |mine| mine.explosions, mine.mines_exploded = cal_explosions(mine) }
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

  private

  def cal_explosions(mine)
    queue = []
    mines_exploded = []
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
          mines_exploded << mine
          i += 1
        end
      end
    end
    [i,mines_exploded]
  end
end
