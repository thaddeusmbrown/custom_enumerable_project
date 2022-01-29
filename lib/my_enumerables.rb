# frozen_string_literal: true

require 'pry-byebug'

module Enumerable
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = []
    my_each do |element|
      if yield(element)
        result.push(element)
      end
    end
    result
  end

  def my_all?
    my_each do |element|
      unless yield(element)
        return false
      end
    end
    true
  end

  def my_any?
    my_each do |element|
      if yield(element)
        return true
      end
    end
    false
  end

  def my_none?
    my_each do |element|
      if yield(element)
        return false
      end
    end
    true
  end

  def my_count
    unless block_given?
      return self.length
    end

    count = 0
    my_each do |element|
      if yield(element)
        count += 1
      end
    end
    count
  end

  def my_map
    result = []
    my_each do |element|
      result.push(yield(element))
    end
    result
  end

  def my_inject(initial_value)
    sum = initial_value
    my_each do |element|
      sum = yield(sum, element)
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield(element)
    end
  end
end
