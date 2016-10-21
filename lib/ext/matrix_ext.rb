require 'matrix'

module MatrixExt
  refine Matrix do
    # set a value to a certain coordinate
    def []=(i, j, x)
      @rows[i][j] = x
    end
  end
end
