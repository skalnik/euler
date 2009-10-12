class Rudoku
  def initialize(sudoku)
    @n = sudoku.size
    @sqrt_n = Math.sqrt(@n).to_i
    raise "wrong sudoku size" unless @sqrt_n * @sqrt_n == @n

    @arr = sudoku.collect { |row|
      (0...@n).collect { |i|
        ((1..@n) === row[i]) ? [row[i]] : (1..@n).to_a
      }
    }

    @rfix = Array.new(@n) { [] }
    @cfix = Array.new(@n) { [] }
    @bfix = Array.new(@n) { [] }
    @n.times { |r| @n.times { |c| update_fix(r, c) } }

    [@rfix, @cfix, @bfix].each { |fix| fix.each { |x|
      unless x.size == x.uniq.size
        raise "non-unique numbers in row, col or box"
      end
    } }
  end

  def solve
    begin
      until finished?
        progress = false
        while reduce
          progress = true
        end
        progress = true if deduce
        return :unknown unless progress
      end
      :solved
    rescue
      :impossible
    end
  end

  def backtrack_solve
    if (res = solve) == :unknown
      r, c = 0, 0
      @rfix.each_with_index { |rf, r|
        break if rf.size < @n
      }
      @arr[r].each_with_index { |x, c|
        break if x.size > 1
      }
      partial = to_a
      solutions = []
      @arr[r][c].each { |guess|
        partial[r][c] = guess
        rsolver = Rudoku.new(partial)
        case rsolver.backtrack_solve
        when :multiple_solutions
        initialize(rsolver.to_a)
        return :multiple_solutions
        when :solved
        solutions << rsolver
        end
      }
      if solutions.empty?
        return :impossible
      else
        initialize(solutions[0].to_a)
        return solutions.size > 1 ? :multiple_solutions : :solved
      end
    end
    res
  end

  def to_a
    @arr.collect { |row| row.collect { |x|
      (x.size == 1) ? x[0] : nil
    } }
  end

  def to_s
    fw = @n.to_s.size
    to_a.collect { |row| row.collect { |x|
      (x ? x.to_s : "_").rjust(fw)
    }.join " " }.join "\n"
  end

  def finished?
    @arr.each { |row| row.each { |x| return false if x.size > 1 } }
    true
  end

  def reduce
    success = false
    @n.times { |r| @n.times { |c|
      if (sz = @arr[r][c].size) > 1
        @arr[r][c] = @arr[r][c] -
        (@rfix[r] | @cfix[c] | @bfix[rc2box(r, c)])
        raise "impossible to solve" if @arr[r][c].empty?
        if @arr[r][c].size < sz
          success = true
          update_fix(r, c)
        end
      end
    } }
    success
  end

  def deduce
    success = false
    [:col_each, :row_each, :box_each].each { |meth|
      @n.times { |i|
        u = uniqs_in(meth, i)
        unless u.empty?
          send(meth, i) { |x|
            if x.size > 1 && ((u2 = u & x).size == 1)
              success = true
              u2
            else
              nil
            end
          }
          return success if success
        end
      }
    }
    success
  end

private
  def rc2box(r, c)
    (r - (r % @sqrt_n)) + (c / @sqrt_n)
  end

  def update_fix(r, c)
    if @arr[r][c].size == 1
      @rfix[r] << @arr[r][c][0]
      @cfix[c] << @arr[r][c][0]
      @bfix[rc2box(r, c)] << @arr[r][c][0]
    end
  end

  def row_each(r)
    @n.times { |c|
      if (res = yield(@arr[r][c]))
        @arr[r][c] = res
        update_fix(r, c)
      end
    }
  end

  def col_each(c)
    @n.times { |r|
      if (res = yield(@arr[r][c]))
        @arr[r][c] = res
        update_fix(r, c)
      end
    }
  end

  def box_each(b)
    off_r, off_c = (b - (b % @sqrt_n)), (b % @sqrt_n) * @sqrt_n
    @n.times { |i|
      r, c = off_r + (i / @sqrt_n), off_c + (i % @sqrt_n)
      if (res = yield(@arr[r][c]))
        @arr[r][c] = res
        update_fix(r, c)
      end
    }
  end

  def uniqs_in(each_meth, index)
    h = Hash.new(0)
    send(each_meth, index) { |x|
      x.each { |n| h[n] += 1 } if x.size > 1
      nil
    }
    h.select { |k, v| v == 1 }.collect { |k, v| k }
  end
end
