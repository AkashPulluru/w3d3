def range(start_num, end_num)
    return [] if end_num <= start_num
    range(start_num, end_num - 1) << end_num - 1
  end

  def recursive_sum(arr)
    return 0 if arr.empty?
    arr[0] + recursive_sum(arr[1..-1])
  end
  
  def iterative_sum(arr)
    sum = 0
    arr.each { |num| sum += num }
    sum
  end

  def exp1(base, power)
    return 1 if power == 0
    base * exp1(base, power - 1)
  end

  def exp2(base, power)
    return 1 if power == 0
    if power.even?
      exp_half = exp2(base, power / 2)
      exp_half * exp_half
    else
      base * exp2(base, power - 1)
    end
  end
  
  class Array
    def deep_dup
      self.map { |element| element.is_a?(Array) ? element.deep_dup : element }
    end
  end

  def fibs_rec(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
  
    prev_fibs = fibs_rec(n - 1)
    prev_fibs << prev_fibs[-1] + prev_fibs[-2]
  end

  def fibs_iter(n)
    return [] if n == 0
    return [0] if n == 1
  
    fibs = [0, 1]
    while fibs.size < n
      fibs << fibs[-1] + fibs[-2]
    end
  
    fibs
  end

  def bsearch(array, target)
    return nil if array.empty?
  
    mid_idx = array.length / 2
  
    case target <=> array[mid_idx]
    when -1
      bsearch(array.take(mid_idx), target)
    when 0
      mid_idx
    when 1
      sub_ans = bsearch(array.drop(mid_idx + 1), target)
      sub_ans.nil? ? nil : (mid_idx + 1) + sub_ans
    end
  end
  
  def merge_sort(array)
    return array if array.length <= 1
  
    mid_idx = array.length / 2
    left_half = array.take(mid_idx)
    right_half = array.drop(mid_idx)
  
    sorted_left = merge_sort(left_half)
    sorted_right = merge_sort(right_half)
  
    merge(sorted_left, sorted_right)
  end
  
  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      merged << (left.first < right.first ? left.shift : right.shift)
    end
  
    merged + left + right
  end
  