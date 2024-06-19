module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0

    for element in self
      yield(element, index)
      index += 1
    end
  end

  def my_select
    arr = Array.new
    for element in self
      arr.push(element) if yield(element)
    end

    arr
  end

  def my_all?
    for element in self
      return false unless yield(element)
    end

    true
  end

  def my_any?
    for element in self
      return true if yield(element)
    end

    false
  end

  def my_none?
    for element in self
      return false if yield(element)
    end

    true
  end

  def my_count
    count = 0
    for element in self
      if block_given?
        next unless yield(element)
      end

      count += 1
    end

    count
  end

  def my_map
    arr = Array.new
    for element in self
      arr.push(yield(element))
    end

    arr
  end

  def my_inject(default = 0)
    accumulator = default
    for element in self
      accumulator = yield(accumulator, element)
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
  end
end
