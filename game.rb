class Game

  def self.alive
    '@'
  end

  def self.dead
    '.'
  end

  def initialize( size_x, size_y )
    @size_x = size_x
    @size_y = size_y
    @world = [
      Array.new( size_x * size_y, Game.dead ),
      Array.new( size_x * size_y )
    ]
    @plane = 0
    @count = 0
  end

  def start( *arr )
    opts = arr.pop if arr.last.instance_of? Hash
    arr.each do |xy|
      set(*xy, Game::alive, opts||{})
    end
  end

  def set( x, y, value=Game::alive, opts={} )
    x,y=[ x+opts[:transform][0], y+opts[:transform][1] ] if opts[:transform]
    @world[@plane][offset(x,y)] = value
  end

  def []=( x, y, value )
    @world[@plane][offset(x,y)] = value
  end

  def []( x, y )
    @world[@plane][offset(x,y)]
  end

  def tick
    (0...@size_x).each do |x|
      (0...@size_y).each do |y|
        neighbours = [
          @world[@plane][ offset( x - 1, y - 1 ) ],
          @world[@plane][ offset( x - 1, y     ) ],
          @world[@plane][ offset( x - 1, y + 1 ) ],
          @world[@plane][ offset( x    , y - 1 ) ],
          @world[@plane][ offset( x    , y + 1 ) ],
          @world[@plane][ offset( x + 1, y - 1 ) ],
          @world[@plane][ offset( x + 1, y     ) ],
          @world[@plane][ offset( x + 1, y + 1 ) ],
        ].count{|c| c==Game.alive }

        case [ @world[@plane][ offset( x, y ) ], neighbours ]
        when [Game.alive, 2], [Game.alive, 3], [Game.dead, 3]
          @world[ 1 - @plane ][ offset( x, y ) ] = Game.alive
        else
          @world[ 1 - @plane ][ offset( x, y ) ] = Game.dead
        end
      end
    end
    @plane = 1 - @plane
    @count += 1
  end

  def display_console(wait=nil)
    clear_screen
    printf(
      (0...@size_y).map do |y|
        y *= @size_x
        @world[@plane][y...y+@size_x] * ' '
      end * "\n"
    )
    printf "\nCTRL+C to break\n"
    sleep wait if wait
  end

  def play_console wait=nil
    system 'tput clear'
    loop do
      tick
      display_console wait
    end
  rescue Interrupt
    puts "\nByeBye\n"
  end

private

  def offset( x, y )
    x = @size_x - 1 if x < 0
    x = 0 if x == @size_x
    y = @size_y - 1 if y < 0
    y = 0 if y == @size_y
    x + y * @size_x
  end

  def clear_screen
    @clear_sequence||=`tput cup 0 0` #`tput clear`
    printf @clear_sequence
    printf "game #{@count}:\n"
  end

end
