class BoardState
  using MatrixExt

  class InvalidCardinalPointError < StandardError; end
  class OutOfBoundaryError < StandardError; end

  MAX_NUMBER_OF_ROWS_AND_COLUMNS = 5
  PLACEHOLDER                    = "_".freeze
  CARDINAL_POINTS                = [NORTH = 'N', EAST = 'E', SOUTH = 'S', WEST = 'W'].freeze
  CARDINAL_SYMBOLS               = %w[⬆ ➡ ⬇ ⬅].freeze
  CARDINAL_MAPPING               = Hash[CARDINAL_POINTS.zip(CARDINAL_SYMBOLS)].freeze

  attr_reader :facing, :x, :y

  def initialize
    @board = Matrix.build(MAX_NUMBER_OF_ROWS_AND_COLUMNS) { PLACEHOLDER }
  end

  def [](x,y)
    @board[x.pred,y.pred]
  end

  def free_current_position
    return unless @x || @y
    @board[@x.pred,@y.pred] = PLACEHOLDER
  end

  def place_on_coordinates(x:, y:, facing:)
    fail OutOfBoundaryError unless safe?(x, y)

    free_current_position

    @facing, @x, @y = facing, x, y

    @board[x.pred,y.pred] = translate_cardinal_point
  end

  def translate_cardinal_point
    CARDINAL_MAPPING.fetch(@facing) { fail InvalidCardinalPointError }
  end

  def inspect
<<-Matrix

          N
      #{@board[4,0]}  #{@board[4,1]}  #{@board[4,2]}  #{@board[4,3]}  #{@board[4,4]}
      #{@board[3,0]}  #{@board[3,1]}  #{@board[3,2]}  #{@board[3,3]}  #{@board[3,4]}
  W   #{@board[2,0]}  #{@board[2,1]}  #{@board[2,2]}  #{@board[2,3]}  #{@board[2,4]}  E
      #{@board[1,0]}  #{@board[1,1]}  #{@board[1,2]}  #{@board[1,3]}  #{@board[1,4]}
      #{@board[0,0]}  #{@board[0,1]}  #{@board[0,2]}  #{@board[0,3]}  #{@board[0,4]}
          S

--------------------------
x: #{x}, y: #{y}, facing: #{@facing}
--------------------------
Matrix
  end

  def safe?(x,y)
    return false if x <= 0 || y <= 0
    !!self[x,y]
  end
end
