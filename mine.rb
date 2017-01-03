class Mine
  attr_accessor :x , :y, :blast_radius, :blowable_mines, :explosions, :time_taken, :mines_exploded

  def initialize(args)
    @x =            args[0].to_i
    @y =            args[1].to_i
    @blast_radius = args[2].to_i
    @blowable_mines = []
    @mines_exploded = []
    @explosions = 0
  end

  def time_taken
    time_exp = 0
    mines_exploded.each do |mine|
      rad = (distance(mine)/blast_radius).to_f.ceil
      time_exp = time_exp < rad ? rad : time_exp
    end
    time_exp
  end

  def inside_blast_radius?(mine)
    distance(mine) <= blast_radius
  end

  def distance(mine)
    Math.sqrt((x - mine.x) * (x - mine.x) + (y - mine.y) * (y - mine.y))
  end

end
