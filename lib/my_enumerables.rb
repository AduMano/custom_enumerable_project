module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?

    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
  end

  def my_select
    return self unless block_given?

    arr = Array.new
    my_each { |element| arr.push(element) if yield(element) }

    arr
  end

  def my_all?
    return true unless block_given?

    my_each { |element| return false unless yield(element) }

    true
  end

  def my_any?
    return true unless block_given?

    my_each { |element| return true if yield(element) }

    false
  end

  def my_none?
    return false unless block_given?

    my_each { |element| return false if yield(element) }

    true
  end

  def my_count
    count = 0
    my_each do |element|
      if block_given?
        next unless yield(element)
      end

      count += 1
    end

    count
  end

  def my_map
    return self unless block_given?

    arr = Array.new
    my_each { |element| arr.push(yield(element)) }

    arr
  end

  def my_inject(default)
    accumulator = default
    my_each { |element| accumulator = yield(accumulator, element) }

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
